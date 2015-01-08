class FeedsController < ApplicationController
  respond_to :html

  def index
   @feeds = Feed.all
  end

  def show
    @feed = Feed.find params[:id]
  end

end
