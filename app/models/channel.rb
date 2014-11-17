class Channel < ActiveRecord::Base
  #
  # schema
  #
  fields do
    title       :string
    url         :string
    description :text
    timestamps
  end
  
  attr_accessible :title, :url, :description

  #
  # Validations
  # 

  #
  # Relations
  # 
  has_many   :saved_articles, dependent: :destroy
  has_one    :notification, dependent: :destroy
  has_one    :filter, dependent: :destroy
  belongs_to :category
  #
  # Methods
  # 
  def get_entries n = 10
    Feedjira::Feed.fetch_and_parse(url).entries.first n
  end
end
