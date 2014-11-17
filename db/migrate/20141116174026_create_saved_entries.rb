class CreateSavedEntries < ActiveRecord::Migration
  def change
    create_table :saved_entries do |t|

      t.timestamps
    end
  end
end
