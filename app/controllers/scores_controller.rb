class ScoresController < ApplicationController

  def import
    @file = params[:file]
    #csvファイルを一行ずつ保存。shift_jisを扱えるようにしている。
    CSV.foreach(@file.path, headers: true,encoding: 'Shift_JIS:UTF-8') do |row|
      if row[1].present?
        #modelに新しいUserを設定       
          @score = Score.new(
            answer: row[1],
            field:  row[2],
            fin_field: row[4],
            question: row[5],
            study_day: row [6]
          )
        #modelをデータベースに保存
          @score.user_id = current_user.id
          @score.save
      end
    end




    @calender = Calender.new(
      study_time: params[:study_time],
      break_time: params[:break_time],
      reflection: params[:reflection]
    )
    @calender.user_id = current_user.id
    @calender.save

    #redirect_to calendar_path(current_user.id)
     render "timers/close", layout: false
  end

  def index
        @time = params[:time]
  end

  def show
    @day = Field.pra(Time.now.in_time_zone.strftime("%Y-%m-%d"))
    @yesterday = Field.pra(Time.now.in_time_zone.yesterday.strftime("%Y-%m-%d"))
    @scores = User.find(params[:id]).scores.where(study_day:@day)
   



  end

end