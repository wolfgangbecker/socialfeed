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
    @filter = FiltersService.destroy params
    respond_to do |format|
      if @filter.errors.empty?
        @feeds = Feed.all
        @filter = nil
        format.js { render 'refresh_all', status: :ok }
      else
        format.js { render 'error', status: :unprocessable_entity }
      end
    end
  end

  def update
    @filter = FiltersService.update params
    respond_to do |format|
      if @filter.errors.empty?
        format.js
      else
        format.js{ render 'error', status: :unprocessable_entity }
      end
    end
  end

  def create
    @filter = FiltersService.create params
    respond_to do |format|
      if @filter.errors.empty?
        format.js
      else
        format.js{ render 'error', status: :unprocessable_entity }
      end
    end
  end
end
