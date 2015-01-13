class Notification < ActiveRecord::Base

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
