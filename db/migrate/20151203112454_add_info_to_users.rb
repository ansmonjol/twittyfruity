class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :avatar, :string
    add_column :users, :followed_users_ids, :string
    add_column :users, :admin, :boolean, default: false
  end
end
