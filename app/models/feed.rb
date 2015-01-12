require 'feedjira'

class Feed < ActiveRecord::Base
  #
  # schema
  #
  fields do
    name          :string
    url           :string
    description   :text
    etag          :string
    last_modified :datetime
    timestamps
  end
  
  attr_accessible :name, :url, :description, :category_id

  #
  # Validations
  # 
  validates :url, presence: true, feed_url: true
  validates :category_id, presence: true
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
    raise 'Feed format issue' if feed.is_a? Numeric
    unless self.etag == feed.etag && self.last_modified == feed.last_modified
      self.etag = feed.etag
      self.last_modified = feed.last_modified
      Entry.add_entries(feed.entries, self.id)
    end
  end
end
