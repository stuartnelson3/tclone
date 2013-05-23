class AddUsernameAndGravatar < ActiveRecord::Migration
  def change
    add_column :users, :user_name, :string
    add_column :users, :gravatar_url, :string
  end
end
