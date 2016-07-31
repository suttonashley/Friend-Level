class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    @friendship.save
  end

  def index
  end

  def destroy
  end
end
