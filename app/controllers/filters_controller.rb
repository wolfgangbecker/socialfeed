class FiltersController < ApplicationController

  def index
    @feeds = Feed.all
    if params[:id]
      @feed = Feed.find params[:id]
      if @feed.filter
        @filter = @feed.filter
      else
        @filter = Filter.new feed_id: @feed.id
      end
    end
  end

  def destroy
    
  end

  def update
    
  end

  def create
    
  end
end
