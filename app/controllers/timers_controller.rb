class TimersController < ApplicationController
    def index
        session[:time] = params[:time]
    end

    def show
        @time = session[:time]
    end

end
