class ScoresController < ApplicationController
      def index
    @scores = Score.all
  end

  def import
    # fileはtmpに自動で一時保存される
    Score.import(params[:file])
    redirect_to scores_url
  end
end
