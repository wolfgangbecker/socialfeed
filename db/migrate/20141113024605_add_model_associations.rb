class AddModelAssociations < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string  :name
      t.string  :tags
      t.text    :description
      t.integer :user_id
    end
    add_index :categories, [:user_id]

    create_table :entries do |t|
      t.string   :title
      t.string   :url
      t.text     :description
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :feed_id
    end
    add_index :entries, [:feed_id]

    create_table :filters do |t|
      t.string   :keywords
      t.boolean  :type
      t.boolean  :active
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :feed_id
    end
    add_index :filters, [:feed_id]

    create_table :notifications do |t|
      t.string  :keywords
      t.integer :feed_id
    end
    add_index :notifications, [:feed_id]

    add_column :users, :notify_new_follower, :boolean, :default => true
    add_column :users, :notify_site_updates, :boolean, :default => true
    add_column :users, :notify_important_topics, :boolean, :default => true

    add_column :feeds, :title, :string
    add_column :feeds, :description, :text
    add_column :feeds, :created_at, :datetime
    add_column :feeds, :updated_at, :datetime
    add_column :feeds, :category_id, :integer

    add_index :feeds, [:category_id]
  end

  def self.down
    remove_column :users, :notify_new_follower
    remove_column :users, :notify_site_updates
    remove_column :users, :notify_important_topics

    remove_column :feeds, :title
    remove_column :feeds, :description
    remove_column :feeds, :created_at
    remove_column :feeds, :updated_at
    remove_column :feeds, :category_id

    drop_table :categories
    drop_table :entries
    drop_table :filters
    drop_table :notifications

    remove_index :feeds, :name => :index_feeds_on_category_id rescue ActiveRecord::StatementInvalid
  end
end
