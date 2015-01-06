class FeedsController < ApplicationController
  respond_to :html

  def index
    @entries = FeedsService.current_entries current_user, 10
    @entries = EntryDecorator.decorate_collection @entries
    respond_with @entries
  end

  def show
    @feed = Feed.find params[:id]
  end

end
