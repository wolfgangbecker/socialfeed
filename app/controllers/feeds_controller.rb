class FeedsController < ApplicationController
  respond_to :html

  def index
   @feeds = Feed.all
  end

  def show
    @feed = Feed.find params[:id]
  end

  def new
    @feed = Feed.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @feed = FeedsService.create current_user, params
    respond_to do |format|
      if @feed.errors.empty?
        @entries = EntriesService.current_entries current_user, 50
        @entries = EntryDecorator.decorate_collection @entries
        format.js
      else
        format.js{ render 'new', status: :unprocessable_entity }
      end
    end
  end
end
