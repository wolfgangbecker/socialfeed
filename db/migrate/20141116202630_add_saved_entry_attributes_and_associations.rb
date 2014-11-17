class AddSavedEntryAttributesAndAssociations < ActiveRecord::Migration
  def self.up
    drop_table :entries

    add_column :saved_entries, :title, :string
    add_column :saved_entries, :url, :string
    add_column :saved_entries, :description, :text
    add_column :saved_entries, :feed_id, :integer
    change_column :saved_entries, :created_at, :datetime, :null => true
    change_column :saved_entries, :updated_at, :datetime, :null => true

    add_column :categories, :created_at, :datetime
    add_column :categories, :updated_at, :datetime

    add_column :notifications, :created_at, :datetime
    add_column :notifications, :updated_at, :datetime

    add_index :saved_entries, [:feed_id]
  end

  def self.down
    remove_column :saved_entries, :title
    remove_column :saved_entries, :url
    remove_column :saved_entries, :description
    remove_column :saved_entries, :feed_id
    change_column :saved_entries, :created_at, :datetime, :null => false
    change_column :saved_entries, :updated_at, :datetime, :null => false

    remove_column :categories, :created_at
    remove_column :categories, :updated_at

    remove_column :notifications, :created_at
    remove_column :notifications, :updated_at

    create_table "entries", :force => true do |t|
      t.string   "title"
      t.string   "url"
      t.text     "description"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "feed_id"
    end

    add_index "entries", ["feed_id"], :name => "index_entries_on_feed_id"

    remove_index :saved_entries, :name => :index_saved_entries_on_feed_id rescue ActiveRecord::StatementInvalid
  end
end
