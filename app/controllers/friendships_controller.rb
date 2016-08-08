class FriendshipsController < ApplicationController
  before_action :authorize

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    @friendship.save
  end

  def show
    @user = User.find(params[:id])
    @friendship = @user.friendships.all
  end

  def destroy
    @friendship_1 = Friendship.find_by(user_id: current_user.id, friend_id: params[:id])
    @friendship_2 = Friendship.find_by(friend_id: current_user.id, user_id: params[:id])
    @friendship_1.destroy
    @friendship_2.destroy
    flash[:notice] = "Successfully destroyed friendship."
    redirect_to current_user
  end

  def accept_friend
    Friendship.accept(current_user.id, params[:friend])
    redirect_to user_path(current_user)
  end

  def decline_friend
    Friendship.decline(current_user.id, params[:friend])
    redirect_to user_path(current_user)
  end

  def add_friend
    Friendship.request(current_user, User.find(params[:friend]))
  end

private

  def friendships_params
    params.require(:friendships).permit(:status, :user_id, :friend_id)
  end

end
