class Entry < ActiveRecord::Base

  #
  # schema
  #
  fields do
    title       :string
    url         :string
    description :text
    timestamps
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
