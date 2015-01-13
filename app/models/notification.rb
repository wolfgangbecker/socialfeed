class Notification < ActiveRecord::Base
  acts_as_tenant :user
  #
  # schema
  #
  fields do
    keywords :string
    user_id  :integer
    timestamps
  end

  attr_accessible :keywords

  #
  # Validations
  # 

  #
  # Relations
  # 
  belongs_to :feed
  #
  # Methods
  # 

end
