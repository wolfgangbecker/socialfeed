class RenameBackToFeedsAndEntries < ActiveRecord::Migration
  def self.up
    rename_table :channels, :feeds

    drop_table :saved_articles

    add_column :entries, :name, :string
    add_column :entries, :summary, :text
    add_column :entries, :url, :string
    add_column :entries, :published_at, :datetime
    add_column :entries, :guid, :string
    add_column :entries, :feed_id, :integer
    change_column :entries, :created_at, :datetime, :null => true
    change_column :entries, :updated_at, :datetime, :null => true

    rename_column :filters, :channel_id, :feed_id

    rename_column :notifications, :channel_id, :feed_id

    add_index :entries, [:feed_id]

    remove_index :feeds, :name => :index_channels_on_category_id rescue ActiveRecord::StatementInvalid
    add_index :feeds, [:category_id]

    remove_index :filters, :name => :index_filters_on_channel_id rescue ActiveRecord::StatementInvalid
    add_index :filters, [:feed_id]

    remove_index :notifications, :name => :index_notifications_on_channel_id rescue ActiveRecord::StatementInvalid
    add_index :notifications, [:feed_id]
  end

  def self.down
    remove_column :entries, :name
    remove_column :entries, :summary
    remove_column :entries, :url
    remove_column :entries, :published_at
    remove_column :entries, :guid
    remove_column :entries, :feed_id
    change_column :entries, :created_at, :datetime, :null => false
    change_column :entries, :updated_at, :datetime, :null => false

    rename_column :filters, :feed_id, :channel_id

    rename_column :notifications, :feed_id, :channel_id

    rename_table :feeds, :channels

    create_table "saved_articles", :force => true do |t|
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "title"
      t.string   "url"
      t.text     "description"
      t.integer  "channel_id"
    end

    add_index "saved_articles", ["channel_id"], :name => "index_saved_articles_on_channel_id"

    remove_index :entries, :name => :index_entries_on_feed_id rescue ActiveRecord::StatementInvalid

    remove_index :channels, :name => :index_feeds_on_category_id rescue ActiveRecord::StatementInvalid
    add_index :channels, [:category_id]

    remove_index :filters, :name => :index_filters_on_feed_id rescue ActiveRecord::StatementInvalid
    add_index :filters, [:channel_id]

    remove_index :notifications, :name => :index_notifications_on_feed_id rescue ActiveRecord::StatementInvalid
    add_index :notifications, [:channel_id]
  end
end
