require 'feedjira'

class Feed < ActiveRecord::Base
  acts_as_tenant :user
  before_validation :set_default_name, if: Proc.new { |feed| feed.name.blank? }
  #
  # schema
  #
  fields do
    name          :string
    url           :string
    description   :text
    etag          :string
    last_modified :datetime
    user_id       :integer
    timestamps
  end
  
  attr_accessible :name, :url, :description, :category_id

  #
  # Validations
  # 
  validates :url, presence: true, feed_url: true
  validates :category_id, presence: true
  validates :name, presence: true
  validates_uniqueness_to_tenant [:name, :url]
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
    notification_entries = []
    unless self.etag == feed.etag && self.last_modified == feed.last_modified
      apply_filter!(feed) if filter._?.active
      user = User.find(user_id)
      if user.notify_important_topics && notification._?.active
        notification_entries = apply_notifications(feed, user)
      end
      self.etag = feed.etag
      self.last_modified = feed.last_modified
      Entry.add_entries(feed.entries, self.id, user_id)
    end
    notification_entries
  end

  protected
    def set_default_name
      self.name = Feedjira::Feed.fetch_and_parse(url).title
    rescue Exception => e
    end
    
    # filter out entries
    def apply_filter! feed
      keywords = filter.keywords.split(',')
      entries = feed.entries.select do |entry|
        if filter.list_type # whitelisting
          entry_contains_any_keyword?(entry, keywords)
        else # blacklisting
          !entry_contains_any_keyword?(entry, keywords)
        end
      end
      feed.entries = entries
    end

    # run email notifications
    def apply_notifications feed, user
      keywords = notification.keywords.split(',')
      notification_entries = []
      feed.entries.each do |entry|
        if !Entry.exists?(guid: entry.id) && entry_contains_any_keyword?(entry, keywords)
          notification_entries << entry
        end
      end
      notification_entries
    end

    # check if the entry contains any of the keywords
    def entry_contains_any_keyword? entry, keywords
      keywords.any? do |keyword| 
        entry.title.include?(keyword) || 
        entry.summary.include?(keyword) ||
        entry._?.content._?.include?(keyword)
      end
    end
end
