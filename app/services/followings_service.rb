class FollowingsService
  # Fetches and parses entries from all feeds of the user and returns them
  def self.search_users user, quantity, search_params
    search = User.ransack(search_params[:q])
    entries = search.result(distinct: true).order('email desc').first(quantity)
    [entries, search]
  end

  def self.create user, params
    Following.update params[:id], params[:following]
  end

  def self.destroy user, following
    
  end
end