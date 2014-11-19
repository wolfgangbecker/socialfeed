require 'feedjira'

class Feed < ActiveRecord::Base
  #
  # schema
  #
  fields do
    name        :string
    url         :string
    description :text
    etag        :string
    timestamps
  end
  
  attr_accessible :name, :url, :description

  #
  # Validations
  # 

  #
  # Relations
  # 
  has_many   :entries, dependent: :destroy
  has_one    :notification, dependent: :destroy
  has_one    :filter, dependent: :destroy
  belongs_to :category
  #
  # Methods
  # 

  def get_latest_entries n
    entries.sort.first(n)
  end

  def update_entries
    feed = Feedjira::Feed.fetch_and_parse(url)
    unless self.etag == feed.etag
      self.etag = feed.etag
      Entry.add_entries(feed.entries, self.id)
    end
  end
end
