class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
    def after_sign_in_path_for(resource)
      #raise resource.has_role?(:admin).inspect
      if resource.has_role?(:admin)
        admin_root_path
      else
        root_path
      end
    end

    before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone, :email, bank_attributes: [:bank_name, :bank_account]])
  end
end