class NotificationsController < ApplicationController

  def index
    @feeds = Feed.all
    @user = current_user
    if params[:id]
      @feed = Feed.find params[:id]
      if @feed.notification
        @notification = @feed.notification
      else
        @notification = Notification.new feed_id: @feed.id
      end
    end
    respond_to do |format|
      format.html
      format.js { render 'refresh_form', status: :ok }
    end
  end

  def update
    @notification = NotificationsService.update params
    respond_to do |format|
      if @notification.errors.empty?
        format.js
      else
        format.js{ render 'refresh_form', status: :unprocessable_entity }
      end
    end
  end  

  def destroy
    @notification = NotificationsService.destroy params
    respond_to do |format|
      if @notification.errors.empty?
        @feeds = Feed.all
        @notification = nil
        format.js { render 'refresh_all', status: :ok }
      else
        format.js { render 'refresh_form', status: :unprocessable_entity }
      end
    end
  end

  def create
    @notification = NotificationsService.create params
    respond_to do |format|
      if @notification.errors.empty?
        format.js
      else
        format.js{ render 'refresh_form', status: :unprocessable_entity }
      end
    end
  end
end
