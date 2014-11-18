class FeedsController < ApplicationController
  respond_to :html

  def index
    feed = Feed.first
    feed.update
    @entries = feed.entries
    respond_with @entries
  end

  def show
    @feed = Feed.find params[:id]
  end

end
