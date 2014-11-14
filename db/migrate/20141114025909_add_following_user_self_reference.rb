class AddFollowingUserSelfReference < ActiveRecord::Migration
  def self.up
    create_table :followings do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :user_id
      t.integer  :followed_id
    end
    add_index :followings, [:user_id]
    add_index :followings, [:followed_id]
  end

  def self.down
    drop_table :followings
  end
end
