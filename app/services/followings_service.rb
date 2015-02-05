class FollowingsService
  # Fetches and parses entries from all feeds of the user and returns them
  def self.search_users user, quantity, search_params
    search = User.except(user).ransack(search_params[:q])
    entries = search.result(distinct: true).order('email desc').first(quantity)
    [entries, search]
  end

  def self.build user, params
    user.followings.build(followed_id: params[:followed_id])
  end

  def self.destroy params
    Following.destroy params[:id]
  end
end