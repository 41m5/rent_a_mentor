class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

   # Redirect user to tutor index page after login
   def after_sign_in_path_for(resource)
    tutors_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
