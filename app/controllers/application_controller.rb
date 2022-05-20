class ApplicationController < ActionController::Base
  # helper_method :current_user
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(
        :name, :email,
        :password_confirmation, :password
      )
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(
        :name, :email,
        :password_confirmation, :password, :current_password
      )
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
