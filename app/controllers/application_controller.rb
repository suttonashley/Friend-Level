class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :pending_tasks,


  def current_user
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
   redirect_to '/login' unless current_user
  end

  def pending_tasks
    current_user.tasks.where(status: "pending", user_id: current_user.id)
  end
  # 
  # def error
  #   if flash[:error]
  #     "You are wrong"
  # end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
