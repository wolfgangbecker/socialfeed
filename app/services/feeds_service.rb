class FeedsService
	# Fetches and parses entries from all feeds of the user and returns them
  def self.latest_entries user, quantity
    feeds = user.feeds
    begin
    	feeds.each(&:update_entries)
    rescue Exception => e
    end
    entries = feeds.map{ |feed| feed.get_latest_entries(quantity) }
    entries.flatten.sort.slice 0, quantity
  end

  # Returns the database stored entries of all feeds from the user
  def self.current_entries user, quantity
    Entry.order('published_at desc').where(feed_id: user.feeds.map(&:id)).first(quantity)
  end
end