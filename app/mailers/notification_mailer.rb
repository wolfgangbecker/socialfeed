class NotificationMailer < ActionMailer::Base
  add_template_helper(EntriesHelper)
  default from: "from@example.com"

  def notify_entries user, notifications
    @user = user
    @notifications = notifications
    mail(to: @user.email, subject: I18n.t('notification_mailer.notify_entries.important_topic_notification'))
  end

  def notify_following follower, followed
    @follower = follower
    @followed = followed
    mail(to: @followed.email, subject: I18n.t('notification_mailer.notify_entries.following_notification'))
  end
end
