class EntriesService
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

  def self.update user, params
    Entry.update params[:id], params[:entry]
  end

  # Returns the database stored entries of all feeds from the user
  def self.current_entries user, quantity
    Entry.order('published_at desc').first(quantity)
  end
end