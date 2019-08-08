class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
      calendars_index_url
      end
      
      def after_sign_out_path_for(resource)
        new_user_registration_url
      end
end
