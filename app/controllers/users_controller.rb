class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(current_user)
    else
      redirect_to '/signup'
    end
  end

  def show
    @user_pending_tasks = Task.where(status: "pending", doer_id: current_user.id)
    @this_user_points = User.friend_level(for_doer: current_user, with_creator: @user)
    @current_user_points = User.friend_level(for_doer: @user, with_creator: current_user)
  end

  def index
    @users = User.where("username LIKE ?", "#{params[:term]}")
  end

private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
