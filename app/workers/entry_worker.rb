class EntryWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { daily.hour_of_day(0).minute_of_hour(1) }

  # daily removal of older entries
  def perform
    feed_ids = Feed.pluck('DISTINCT id')
    feed_ids.each do |feed_id|
			cutoff = Entry.where(feed_id: feed_id).order('published_at DESC').offset(50).first
			Entry.where(feed_id: feed_id).deletable.where(['published_at <= ?', cutoff.published_at]).delete_all
		end
  rescue Exception => e
    logger.debug "EntryWorker:/n#{e.message}"
  end
end