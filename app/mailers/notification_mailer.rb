class NotificationMailer < ActionMailer::Base
  add_template_helper(EntriesHelper)
  default from: "from@example.com"

  def notify_entries user, notifications
    @user = user
    @notifications = notifications
    mail(to: @user.email, subject: 'Important Topic Notification')
  end
end
