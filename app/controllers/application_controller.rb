class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def after_sign_in_path_for(_resource)
    if devise_controller? && resource_name == :admin
      # admin_root_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(_resource)
    if devise_controller? && resource_name == :admin
      # admin_root_path
    else
      new_user_session_path
    end
  end

  def remember_me
    true
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
