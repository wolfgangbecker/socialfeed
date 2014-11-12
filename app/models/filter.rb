class Filter < ActiveRecord::Base

  #
  # schema
  #
  fields do
    keywords  :string
    type      :boolean # true => whitelist, false => blacklist
    active    :boolean
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
