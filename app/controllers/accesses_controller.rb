class AccessesController < ApplicationController
   def index
        session[:study_time] = params[:study_time]
        session[:break_time] = params[:break_time]
    end
  def hello
  end

  def goodbye
  end
end
