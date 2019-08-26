class MicropostsController < ApplicationController

    def show
      @micropost  = current_user.microposts.build
      @feed_items = Micropost.all
      end
      def create
        @feed_items = Micropost.all

        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
          flash[:success] = "Micropost created!"
          redirect_to micropost_path(current_user.id)
        else
          redirect_to micropost_path(current_user.id)
        end
      end
    
      def destroy
      end
      private

      def micropost_params
        params.require(:micropost).permit(:content)
      end
      
end
