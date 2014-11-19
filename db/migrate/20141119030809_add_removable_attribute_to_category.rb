class AddRemovableAttributeToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :removable, :boolean, :default => true
  end

  def self.down
    remove_column :categories, :removable
  end
end
