class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authorize_admin!, :except => [:index, :show]
  # def user_params
  # 	params.require(:user).permit(:email, :password, :password_confirmation, :remember_me)
  # end
  private
  def authorize_admin!
  	authenticate_user!
  	unless current_user.admin?
  		flash[:alert] = "You must be admin to do that"
  		redirect_to root_path
  	end
  end
end

