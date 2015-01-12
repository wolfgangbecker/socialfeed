class FeedsService
  # Fetches and parses entries from all feeds of the user and returns them
  def self.create user, params
    Feed.create params[:feed]
  end
end