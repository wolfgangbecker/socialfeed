class RenameToChannelAndSavedArticle < ActiveRecord::Migration
  def self.up
    rename_table :feeds, :channels
    rename_table :saved_entries, :saved_articles

    rename_column :saved_articles, :feed_id, :channel_id

    rename_column :filters, :feed_id, :channel_id

    rename_column :notifications, :feed_id, :channel_id

    remove_index :channels, :name => :index_feeds_on_category_id rescue ActiveRecord::StatementInvalid
    add_index :channels, [:category_id]

    remove_index :saved_articles, :name => :index_saved_entries_on_feed_id rescue ActiveRecord::StatementInvalid
    add_index :saved_articles, [:channel_id]

    remove_index :filters, :name => :index_filters_on_feed_id rescue ActiveRecord::StatementInvalid
    add_index :filters, [:channel_id]

    remove_index :notifications, :name => :index_notifications_on_feed_id rescue ActiveRecord::StatementInvalid
    add_index :notifications, [:channel_id]
  end

  def self.down
    rename_column :saved_articles, :channel_id, :feed_id

    rename_column :filters, :channel_id, :feed_id

    rename_column :notifications, :channel_id, :feed_id

    rename_table :channels, :feeds
    rename_table :saved_articles, :saved_entries

    remove_index :feeds, :name => :index_channels_on_category_id rescue ActiveRecord::StatementInvalid
    add_index :feeds, [:category_id]

    remove_index :saved_entries, :name => :index_saved_articles_on_channel_id rescue ActiveRecord::StatementInvalid
    add_index :saved_entries, [:feed_id]

    remove_index :filters, :name => :index_filters_on_channel_id rescue ActiveRecord::StatementInvalid
    add_index :filters, [:feed_id]

    remove_index :notifications, :name => :index_notifications_on_channel_id rescue ActiveRecord::StatementInvalid
    add_index :notifications, [:feed_id]
  end
end
