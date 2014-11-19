class FeedsService
  def self.latest_entries user, quantity
    feeds = user.feeds
    feeds.each(&:update_entries)
    entries = feeds.map{ |feed| feed.get_latest_entries(quantity) }
    entries.flatten.sort.slice 0, quantity
  end
end