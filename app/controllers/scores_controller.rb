class ScoresController < ApplicationController

  def import
    @file = params[:file]
    #csvファイルを一行ずつ保存。shift_jisを扱えるようにしている。
    CSV.foreach(@file.path, headers: true,encoding: 'Shift_JIS:UTF-8') do |row|
        #modelに新しいUserを設定       
          @model = Score.new(
            answer: row[1],
            field:  row[2],
            fin_field: row[4],
            question: row[5],
            study_day: row [6]
          )
        #modelの値が存在しないときに処理をやめる。なぜか最後に空白行が入るから。
          if @model.answer.nil? 
            redirect_to account_path(current_user.id) and return 
          end
        #modelをデータベースに保存
          @model.user_id = current_user.id
          @model.save
        end
    redirect_to account_path(current_user.id)
  end
end