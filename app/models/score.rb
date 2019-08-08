class Score < ApplicationRecord
        def self.import(file)
        #csvファイルを一行ずつ保存。shift_jisを扱えるようにしている。
        CSV.foreach(file.path, headers: true,encoding: 'Shift_JIS:UTF-8') do |row|
        #modelに新しいUserを設定       
          model = Score.new(
            answer: row[1],
            field:  row[2],
            fin_field: row[4],
            question: row[5],
            study_day: row [6]
          )
        #modelをデータベースに保存aaaa
          model.save
        end
    end

end
