class Notification < ActiveRecord::Base

  #
  # schema
  #
  fields do
    keywords :string
    timestamps
  end

  attr_accessible :keywords

  #
  # Validations
  # 

  #
  # Relations
  # 
  belongs_to :channel
  #
  # Methods
  # 

end
