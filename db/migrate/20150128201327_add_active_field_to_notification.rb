class AddActiveFieldToNotification < ActiveRecord::Migration
  def self.up
    add_column :notifications, :active, :boolean, :default => true
  end

  def self.down
    remove_column :notifications, :active
  end
end
