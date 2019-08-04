class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        accesses_goodbye_url
      end
      
      def after_sign_out_path_for(resource)
        accesses_hello_url
      end
end
