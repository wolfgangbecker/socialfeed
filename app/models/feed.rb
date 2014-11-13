class Feed < ActiveRecord::Base

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
  has_many   :entries
  has_one    :notification
  has_one    :filter
  belongs_to :category
  #
  # Methods
  # 
  def get_entries
    Feedjira::Feed.fetch_and_parse(url).entries
  end

end
