class FeedWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { hourly.minute_of_hour(0, 15, 30, 45) }

  def perform
    Feed.find_each(batch_size: 100) do |feed|
    	feed.update_entries
    end
  rescue Exception => e
  end
end