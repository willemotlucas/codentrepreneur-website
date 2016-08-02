class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  	# We need to declare all the attributes that a user can enter on sign up form
  	# Email and password are already managed by Devise
  	def configure_permitted_parameters
  		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  	end
end
