class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user


  def current_user
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
   redirect_to '/login' unless current_user
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
