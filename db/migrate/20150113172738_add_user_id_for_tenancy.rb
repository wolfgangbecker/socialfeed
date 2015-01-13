class AddUserIdForTenancy < ActiveRecord::Migration
  def self.up
    add_column :entries, :user_id, :integer

    add_column :feeds, :user_id, :integer

    add_column :filters, :user_id, :integer

    add_column :notifications, :user_id, :integer
  end

  def self.down
    remove_column :entries, :user_id

    remove_column :feeds, :user_id

    remove_column :filters, :user_id

    remove_column :notifications, :user_id
  end
end
