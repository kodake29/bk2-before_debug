class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

 
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Signed out successfully.'
  end

   protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end
