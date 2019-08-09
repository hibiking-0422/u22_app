class AccountsController < ApplicationController
   before_action :authenticate_user!

  def show
    @user = User.find(params[:id])

    @scores = @user.scores

    @scores.each do |score|
      
      case score.field
      when 'テクノロジ系'
       @tec_count =@tec_count + 1
      when 'ストラテジ系'
       @stra_count =@stra_count + 1
      when 'マネジメント系'
       @mana_count = @mana_count + 1
      end
    end

    total = @scores.count

    @tec_total =@tec_count / total
    @stra_total = @stra_count / total
    @mana_total = @mana_count / total
    

  end
end
