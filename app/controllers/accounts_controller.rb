class AccountsController < ApplicationController
   before_action :authenticate_user!

  def show
    @scores = User.find(params[:id]).scores

    @total_ans = @scores.where(answer:'○').count
    @total_total = @scores.count
    @total_per = ((@total_ans/ @total_total.to_f) * 100).floor



    
    @genes = Field.sepa(@scores)



  




    @tec_ans = @scores.where(answer:'○').where(field:'テクノロジ系').count
    @tec_total =  @scores.where(field:'テクノロジ系').count
    @tec_per = ((@tec_ans / @tec_total.to_f) * 100).floor

    @mana_ans = @scores.where(answer:'○').where(field:'マネジメント系').count
    @mana_total = @scores.where(field:'マネジメント系').count
    @mana_per = ((@mana_ans / @mana_total.to_f) * 100).floor

    @stra_ans = @scores.where(answer:'○').where(field:'ストラテジ系').count
    @stra_total =  @scores.where(field:'ストラテジ系').count
    @stra_per = ((@stra_ans / @stra_total.to_f) * 100).floor

  end
end

