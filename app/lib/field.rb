class Field
    def self.sepa(scores)
        genes =  scores.pluck(:field).uniq

        models = []

       genes.each do |n|
            arry = []
            arry[0] = n
            arry[1] = scores.where(answer:'○').where(field:arry[0]).size
            arry[2] = scores.where(field:arry[0]).size
            arry[3] = ((arry[1] / arry[2].to_f) * 100).floor

            models.push(arry)
        end

        return models
    end

    def self.sepa_fin(scores)
        genes =  scores.pluck(:fin_field).uniq

        models = []

       genes.each do |n|
            arry = []
            arry[0] = n
            arry[1] = scores.where(answer:'○').where(fin_field:arry[0]).size
            arry[2] = scores.where(fin_field:arry[0]).size
            arry[3] = ((arry[1] / arry[2].to_f) * 100).floor

            models.push(arry)
        end

        return models
    end

    def self.sepa_que(scores)
        genes =  scores.pluck(:question).uniq

        models = []

       genes.each do |n|
            arry = []
            arry[0] = n
            arry[1] = scores.where(answer:'○').where(question:arry[0]).size
            arry[2] = scores.where(question:arry[0]).size
            arry[3] = ((arry[1] / arry[2].to_f) * 100).floor

            models.push(arry)
        end

        return models
    end




    
end





