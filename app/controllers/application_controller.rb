class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end

  protected
  	# We need to declare all the attributes that a user can enter on sign up form
  	# Email and password are already managed by Devise
  	def configure_permitted_parameters
  		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  	end
end
