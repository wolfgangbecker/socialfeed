class Category < ActiveRecord::Base

  #
  # schema
  #
  fields do
    name        :string
    tags        :string
    description :text
  end

  attr_protected

  #
  # Validations
  # 

  #
  # Relations
  # 
  has_many   :feeds
  belongs_to :user
  #
  # Methods
  # 

end
