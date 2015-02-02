class FeedWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { hourly.minute_of_hour(0, 15, 30, 45) }

  # update all feed's entries
  def perform
    User.find_each(batch_size: 10) do |user|
      notifications = []
      user.feeds.each do |feed|
        begin
          entries = feed.update_entries
          unless !user.notify_important_topics || entries.empty?
      	    notifications << {feed: feed, entries: entries}
          end
        rescue Exception => e
          logger.debug "FeedWorker:/n#{e.message}"
        end
      end
      unless notifications.empty?
        NotificationMailer.notify_entries(user, notifications).deliver
      end
    end
  end
end