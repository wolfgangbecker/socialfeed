class SetFilterDefaults < ActiveRecord::Migration
  def self.up
    change_column :filters, :type, :boolean, :default => false
    change_column :filters, :active, :boolean, :default => true
  end

  def self.down
    change_column :filters, :type, :boolean
    change_column :filters, :active, :boolean
  end
end
