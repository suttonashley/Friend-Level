class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :pending_tasks, :pending_friends


  def current_user
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
   redirect_to '/login' unless current_user
  end

  def pending_tasks
    current_user.tasks.where(status: "pending", user_id: current_user.id)
  end

  def pending_friends
    current_user.friendships.where(status:"pending", user_id: current_user.id)
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
