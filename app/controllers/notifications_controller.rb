class NotificationsController < ApplicationController

  def index
    @feeds = Feed.all
    if params[:id]
      @feed = Feed.find params[:id]
      if @feed.notification
        @notification = @feed.notification
      else
        @notification = Notification.new feed_id: @feed.id
      end
    end
    # respond_to do |format|
    #   format.html
    #   format.js { render 'refresh_form', status: :ok }
    # end
  end

  def show
  end

  def new
  end

  def edit
  end

  def updatetifi
  end  

  def create
  end

  def destroy
  end
end
