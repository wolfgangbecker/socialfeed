class AddReadToEntries < ActiveRecord::Migration
  def self.up
    add_column :entries, :read, :boolean
  end

  def self.down
    remove_column :entries, :read
  end
end
