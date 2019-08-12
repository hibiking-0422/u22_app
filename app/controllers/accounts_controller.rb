class AccountsController < ApplicationController
   before_action :authenticate_user!

  def show
    @scores = User.find(params[:id]).scores

    @total_ans = @scores.where(answer:'○').count
    @total_total = @scores.count
    @total_per = ((@total_ans/ @total_total.to_f) * 100).floor



    
    @genes = Field.sepa(@scores)
    @fin_genes = Field.sepa_fin(@scores)
    @questions = Field.sepa_que(@scores)
    
  end
end

