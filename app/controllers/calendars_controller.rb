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

    @now_day = @day
    num = 0
    while num < 1000 do
      num += 1
      @now_day = Field.pra(Time.parse(@now_day).yesterday.strftime("%Y-%m-%d"))
      @scores.each do |score|
        if score.study_day == @now_day then
          @yesterday = @now_day
        end
      end
      if @yesterday.present? then
        break
      end
    end

    now_day = Field.pra(Time.parse(@day).yesterday.strftime("%Y-%m-%d"))

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

    @study_time = 0
    @break_time = 0
    @calenders.each do |calender|
      @study_time += calender.study_time 
      @break_time += calender.break_time
    end

    box = @scores.where(study_day:@day)
    goods = Field.sepa(box,"fin_field")
    
    arry = []
    @su = []
    @mu = []
    goods.each do |good|
      arry.push(good[3])
    end
    goods.each do |good|
      if good[3] == arry.max
        @su.push(good[0])
      end
      if good[3] == arry.min
        @mu.push(good[0])
      end
    end

  end
end
