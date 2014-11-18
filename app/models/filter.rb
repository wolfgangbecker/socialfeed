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
  
  attr_accessible :keywords, :type, :active

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
