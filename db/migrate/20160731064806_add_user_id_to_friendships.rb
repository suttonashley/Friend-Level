class AddUserIdToFriendships < ActiveRecord::Migration[5.0]
  def change
    add_reference :friendships, :user, foreign_key: true
    add_column :friendships, :friend_id, :integer
  end
end
