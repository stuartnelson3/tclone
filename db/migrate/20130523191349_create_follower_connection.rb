class CreateFollowerConnection < ActiveRecord::Migration
  def change
    create_table :follower_connections do |t|
      t.integer :user_id
      t.integer :follower_id
    end
  end
end
