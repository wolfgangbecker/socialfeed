class EntriesController < ApplicationController

  def index
    if params[:user_id]
      @user = current_user.followeds.find(params[:user_id])
      ActsAsTenant.current_tenant = @user
    end
    @entries, @q = EntriesService.current_entries 50, params
    @entries = EntryDecorator.decorate_collection @entries
    @feed = Feed.new
    unless params[:category].blank?
      category_ids = params[:category].split
      @feeds = Feed.where(category_id: category_ids)
      @category = [Category.find(category_ids)].flatten
    else
      @feeds = Feed.all
    end
  end

  def show
    @entry = Entry.find params[:id]
  end

  def update
  	@entry = EntriesService.update current_user, params
    @read_changed = true unless params[:entry][:read].blank?
    @entry = EntryDecorator.decorate @entry
  	respond_to do |format|
      format.js
  	end
  end
end
