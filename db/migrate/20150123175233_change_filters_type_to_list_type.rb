class ChangeFiltersTypeToListType < ActiveRecord::Migration
  def self.up
    rename_column :filters, :type, :list_type
  end

  def self.down
    rename_column :filters, :list_type, :type
  end
end
