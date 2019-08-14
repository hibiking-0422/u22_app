class CalendarsController < ApplicationController
  def index
    
  end

  def show
    @scores = User.find(params[:id]).scores

    if params[:day].nil? then
      @day = Time.now.strftime("%Y-%m-%d")
    else
      @day = params[:day]
    end

    @day = Field.pra(@day)
    
    @yesterday = Field.pra(Time.parse(@day).yesterday.strftime("%Y-%m-%d"))

    @seito_per = Field.deb(@scores,@day,nil)
    @yes_seito_per = Field.deb(@scores,@yesterday,nil)


    @dif = (@seito_per[2] - @yes_seito_per[2]).abs
    if  @seito_per[2] - @yes_seito_per[2] >= 0 then 
      @wo = "上がりました!"
    elsif @seito_per[2] - @yes_seito_per[2] < 0
      @wo = "下がりました..."
    end

    @stra_per = Field.deb(@scores,@day,"ストラテジ系")
    @mana_per = Field.deb(@scores,@day,"マネジメント系")
    @tec_per = Field.deb(@scores,@day,"テクノロジ系")

    @calenders = User.find(params[:id]).calenders.where(created_at: @day.in_time_zone.all_day)

    @date = Time.parse(@day)

    #@calenders.each do |calender|
     ## @study_time += calender.study_time
      #@break_time += calender.break_time
    #end
  end
end
