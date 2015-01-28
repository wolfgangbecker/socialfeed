class Notification < ActiveRecord::Base
  acts_as_tenant :user
  #
  # schema
  #
  fields do
    keywords :string
    active   :boolean, default: true
    user_id  :integer
    timestamps
  end

  attr_accessible :keywords, :active, :feed_id

  #
  # Validations
  # 
  validates :user_id, presence: true
  validates :keywords, presence: true

  #
  # Relations
  # 
  belongs_to :feed
  #
  # Methods
  # 

end
