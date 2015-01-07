class AddFavoriteToEntries < ActiveRecord::Migration
  def self.up
    add_column :entries, :favorite, :boolean
  end

  def self.down
    remove_column :entries, :favorite
  end
end
