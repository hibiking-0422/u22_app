class Field
    def self.sepa(scores)
        genes =  scores.pluck(:field).uniq



        arry=[]
        models = []
        genes.each do |gene|
            arry[0] = gene
            arry[1] = scores.where(answer:'○').where(field:arry[0]).size
            arry[2] = scores.where(field:arry[0]).size
            arry[3] = ((arry[1] / arry[2].to_f) * 100).floor

            models.push(arry)
        end
        return models
    end
end





