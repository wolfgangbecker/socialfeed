class NotificationsService
  # Fetches and parses entries from all feeds of the user and returns them
  def self.create params
    Notification.create params[:notification]
  end

  def self.update params
    Notification.update params[:id], params[:notification]
  end

  def self.edit params
    Notification.find params[:id]
  end

  def self.destroy params
    Notification.destroy params[:id]
  rescue Exception => e
    notification = Notification.find params[:id]
    notification.errors.add(:notification, e.message)
    notification
  end
end