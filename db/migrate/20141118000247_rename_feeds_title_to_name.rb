class RenameFeedsTitleToName < ActiveRecord::Migration
  def self.up
    rename_column :feeds, :title, :name
  end

  def self.down
    rename_column :feeds, :name, :title
  end
end
