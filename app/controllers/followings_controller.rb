class FollowingsController < ApplicationController
  def index
    @users, @q = FollowingsService.search_users current_user, 50, params
  end

  def create
    @following = FollowingsService.build current_user, params
    respond_to do |format|
      if @following.save
        format.js
      else
        format.js { render 'error', status: :ok }
      end
    end
  end

  def destroy
    @following = FollowingsService.destroy params
    respond_to do |format|
      if @following.errors.empty?
        format.js
      else
        format.js { render 'error', status: :ok }
      end
    end
  end
end
