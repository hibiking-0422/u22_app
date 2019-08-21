class MypagesController < ApplicationController
  def show
    @scores = User.find(params[:id]).scores
  end
end
