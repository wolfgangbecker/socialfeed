class Following < ActiveRecord::Base
  acts_as_tenant :user
  after_create :notify_following, if: Proc.new { followed.notify_new_follower }
  #
  # schema
  #
  fields do
    timestamps
  end

  attr_protected

  #
  # Validations
  # 
  validates_uniqueness_to_tenant :followed_id

  #
  # Relations
  # 
  belongs_to :user
  belongs_to :followed, class_name: 'User'

  #
  # Methods
  # 
  private
    def notify_following
      NotificationMailer.notify_following(user, followed).deliver
    end
end
