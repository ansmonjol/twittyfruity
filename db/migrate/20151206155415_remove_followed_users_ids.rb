class RemoveFollowedUsersIds < ActiveRecord::Migration
  def change
    remove_column :users, :followed_users_ids
  end
end
