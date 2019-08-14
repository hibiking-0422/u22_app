class Field
    def self.sepa(scores,column)
        genes =  scores.pluck(column).uniq

        models = []

       genes.each do |n|
            arry = []
            arry[0] = n
            arry[1] = scores.where(answer:"○").where(column => arry[0]).size
            arry[2] = scores.where(column => arry[0]).size
            arry[3] = ((arry[1] / arry[2].to_f) * 100).floor

            models.push(arry)
        end

        return models
    end    

    def self.pra (day)
        day =day.gsub(/-/, '/')

        if day[5] == "0" then
            day[5] = ""
            if day[7] == "0" then
                  day[7] = ""
            end
    
        else
             if day[8] == "0" then
                  day[8] = ""
            end
        end
        return day
    end

    def self.deb(scores,day,gene)
        seito =[]
        if gene.nil? then
            seito.push(scores.where(answer:'○').where(study_day:day).size)
            seito.push(scores.where(study_day:day).size)
        else
            seito.push(scores.where(answer:'○').where(study_day:day).where(field:gene).size)
            seito.push(scores.where(study_day:day).where(field:gene).size)
        end
        if seito[1] == 0 then
          seito.push(0)
        else
          seito.push(((seito[0] / seito[1].to_f) * 100).floor)
        end
        return seito
    end
end
