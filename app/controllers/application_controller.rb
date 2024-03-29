class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :username, :remember_me, :first_name, :last_name, :role,
      :title, :company,:expertise, :experience, :website, :location, :excited_about, :bio, :linkedin, :twitter, :instagram,
      :skill_list, :industry_list, :client_list)}
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :current_password, :password, :password_confirmation, :username, :first_name, :last_name, :role,
      :title, :company,:expertise, :experience, :website, :location, :excited_about, :bio, :linkedin, :twitter, :instagram,
      :skill_list, :industry_list, :client_list)}
    devise_parameter_sanitizer.for(:accept_invitation) { |u| u.permit(:email, :invitation_token, :password, :password_confirmation, :username, :remember_me, :first_name, :last_name, :role,
      :title, :company,:expertise, :experience, :website, :location, :excited_about, :bio, :linkedin, :twitter, :instagram,
      :skill_list, :industry_list, :client_list)}
  end
end
