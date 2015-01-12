class FeedsService
  # Fetches and parses entries from all feeds of the user and returns them
  def self.create user, params
    feed = Feed.create params[:feed]
    if feed.errors.empty?
      feed.update_entries
    end
    feed
  end
end