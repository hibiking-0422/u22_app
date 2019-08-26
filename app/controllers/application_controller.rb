class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) 
  end
 

    def after_sign_in_path_for(resource)
      micropost_path(current_user.id)
      end
      
      def after_sign_out_path_for(resource)
        root_url
      end
end
