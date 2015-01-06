class FeedsService
  def self.latest_entries user, quantity
    feeds = user.feeds
    begin
    	feeds.each(&:update_entries)
    rescue Exception => e
    end
    entries = feeds.map{ |feed| feed.get_latest_entries(quantity) }
    entries.flatten.sort.slice 0, quantity
  end
end