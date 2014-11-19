class DropRemovableAddEditableToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :editable, :boolean, :default => true
    remove_column :categories, :removable
  end

  def self.down
    remove_column :categories, :editable
    add_column :categories, :removable, :boolean, :default => true
  end
end
