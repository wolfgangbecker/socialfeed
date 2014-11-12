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

  #
  # Methods
  # 

end
