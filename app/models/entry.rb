class Entry < ActiveRecord::Base
  acts_as_tenant :user
  #
  # schema
  #
  fields do
    name         :string
    summary      :text
    content      :text
    url          :string
    published_at :datetime
    guid         :string
    favorite     :boolean, default: false
    read         :boolean, default: false
    user_id      :integer
    timestamps
  end
  

  attr_accessible :name, :summary, :content, :url, :published_at, :guid, :feed_id, :read, :favorite, :user_id

  #
  # Validations
  # 

  #
  # Scope
  # 
  scope :deletable, -> { where(favorite: false) }

  #
  # Relations
  # 
  belongs_to :feed
  #
  # Methods
  # 
  def self.add_entries entries, feed_id, user_id
    entries.each do |entry|
      unless exists? :guid => entry.id
        create!(
          name:         entry.title,
          summary:      entry.summary,
          content:      entry._?.content,
          url:          entry.url,
          published_at: entry.published,
          guid:         entry.id,
          feed_id:      feed_id,
          user_id:      user_id
        )
      end
    end
  end

  def <=> other_entry
    other_entry.published_at <=> published_at
  end
end
