class FollowingsController < ApplicationController
  def index
    @users, @q = FollowingsService.search_users current_user, 50, params
  end

  def create
  end

  def destroy
  end
end
