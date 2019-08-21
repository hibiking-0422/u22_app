class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) 
  end
 

    def after_sign_in_path_for(resource)
      calendars_url
      end
      
      def after_sign_out_path_for(resource)
        new_user_registration_url
      end
end
