class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?, only: %i[new create]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username email password])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username email password current_password])
  end
end
