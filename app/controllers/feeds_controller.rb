class FeedsController < ApplicationController

  def index
    @feeds = Feed.first 10
  end

  def show
    @feed = Feed.find params[:id]
  end

end
