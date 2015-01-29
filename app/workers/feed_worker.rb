class FeedWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { hourly.minute_of_hour(0, 15, 30, 45) }

  # update all feed's entries
  def perform
    Feed.find_each(batch_size: 100) do |feed|
      begin
    	  feed.update_entries
      rescue Exception => e
        logger.debug "FeedWorker:/n#{e.message}"
      end
    end
  end
end