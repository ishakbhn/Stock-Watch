class User::RegistrationsController < Devise::RegistrationsController
  # before filter configure_permitted_parameters
  # define comfigure_permitted_parameters
  # need to allow first name and last name
  before_action :configure_permitted_parameters

  protected
  #put insert first name and last name in sign up and update profile
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end