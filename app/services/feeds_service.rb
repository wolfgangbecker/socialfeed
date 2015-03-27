class FeedsService
  def self.create user, params
    feed = Feed.create params[:feed]
    if feed.errors.empty?
      feed.update_entries
    end
    feed
  end

  def self.destroy params
    Feed.destroy params[:id]
  end
end