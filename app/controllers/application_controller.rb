class ApplicationController < ActionController::Base
  # SET LANGUAGE AS FRENCH
  before_action do
    I18n.locale = :fr
  end

  # ADD OTHER TYPES OF Flash[:xxx] MESSAGES
  add_flash_types :info, :danger, :warning, :success

  # DEVISE CONFIGURATION TO ACCEPT MORE PARAMETERS
  before_action :configure_devise_parameters, if: :devise_controller?


  protected

  def configure_devise_parameters
    # SIGN-UP : PERMIT PARAMS
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, :remember_me)}
    # ACCOUNT-UPDATE : PERMIT PARAMS
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)}
    # SIGN-IN : PERMIT PARAMS
    devise_parameter_sanitizer.permit(:sign_in) {|u| u.permit(:email, :password, :remember_me)}
  end
end
