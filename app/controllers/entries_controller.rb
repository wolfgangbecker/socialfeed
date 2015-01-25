class EntriesController < ApplicationController

  def index
    @entries, @q = EntriesService.current_entries current_user, 50, params
    @entries = EntryDecorator.decorate_collection @entries
    @feed = Feed.new
    unless params[:category].blank?
      @feeds = Feed.where(category_id: params[:category])
      @category = [Category.find(params[:category])].flatten
    else
      @feeds = Feed.all
    end
  end

  def show
    @entry = Entry.find params[:id]
  end

  def update
  	@entry = EntriesService.update current_user, params
  	respond_to do |format|
  		if @entry.errors.empty?
	      format.json { render json: @entry, status: :ok }
  		else
  			format.json { render json: @entry.errors.full_messages, status: :unprocessable_entity }
    	end
  	end
  end
end
