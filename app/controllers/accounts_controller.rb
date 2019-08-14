class AccountsController < ApplicationController
   before_action :authenticate_user!

  def show
    @scores = User.find(params[:id]).scores

    @ans = "answer"

    @total_ans = @scores.where(@ans => "○").count
    @total_total = @scores.count
    @total_per = ((@total_ans/ @total_total.to_f) * 100).floor

    ans = "answer"

    
    @genes = Field.sepa(@scores,"field")
    @fin_genes = Field.sepa(@scores,"fin_field")
    @questions = Field.sepa(@scores,"question")

    @calenders = Calender.all
  end
end

