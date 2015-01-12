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
        format.js
      else
        format.js{ render 'new', status: :unprocessable_entity }
      end
    end
  end
end
