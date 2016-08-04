class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def new
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
    @user_accepted_tasks = Task.where(status: "accepted", doer_id: @user.id)
    @user_pending_tasks = current_user.tasks.where(status: "pending", user_id: current_user.id)
  end

  def index
    @users = User.where("username LIKE ?", "#{params[:term]}")
  end

private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
