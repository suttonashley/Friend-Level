class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    @friendship.save
  end

  def show
    @user = User.find(params[:id])
    @friendship = @user.friendships.all
  end

  def destroy
    @friendship = current_user.friendships.find_by(friend: params[:id])
    @friendship.destroy
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
