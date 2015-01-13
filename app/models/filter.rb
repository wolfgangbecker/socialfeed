class Filter < ActiveRecord::Base
  acts_as_tenant :user
  #
  # schema
  #
  fields do
    keywords  :string
    type      :boolean # true => whitelist, false => blacklist
    active    :boolean
    user_id   :integer
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
