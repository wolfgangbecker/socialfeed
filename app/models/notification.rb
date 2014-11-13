class Notification < ActiveRecord::Base

  #
  # schema
  #
  fields do
    keywords :string
  end

  attr_protected

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
