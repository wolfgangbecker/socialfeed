class NotificationMailer < ActionMailer::Base
  add_template_helper(EntriesHelper)
  default from: "from@example.com"

  def notify_entry user, entry
    @user = user
    @entry = EntryDecorator.decorate(entry)
    mail(to: @user.email, subject: 'Important Topic Notification')
  end
end
