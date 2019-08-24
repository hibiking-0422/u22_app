class CalendarsController < ApplicationController
  require "date"
  def index
    scores = User.find(current_user.id).scores

    @blo = 0
    if params[:month].nil? then
      @today = Date.today
    else
      if params[:ch].nil?
        @today = Date.strptime(params[:month]).last_month
      else
        @today = Date.strptime(params[:month]).next_month
      end
    end

    first = @today.at_beginning_of_month
    last  = @today.at_end_of_month

    @months = []
    loop do
      @months.push(Field.pra(first.strftime("%Y-%m-%d")))
      if first == last then
        break
      end
      first = first + 1
    end
 

    @ans = []
    @months.each do |month|
      @ans.push(scores.where(study_day:month).where(answer:'○').size)
    end

    gon.ans = @ans
    gon.last = last

  end

  def show
    @scores = User.find(params[:id]).scores

    if params[:day].nil? then
      @day = Time.now.in_time_zone.strftime("%Y-%m-%d")
    else
      @day = params[:day]
    end

    @day = Field.pra(@day)

    @now_day = @day
    num = 0
    while num < 1000 do
      num += 1
      @now_day = Field.pra(Time.parse(@now_day).in_time_zone.yesterday.strftime("%Y-%m-%d"))
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

    gon.stra_per = @stra_per[2]
    gon.mana_per = @mana_per[2]
    gon.tec_per = @tec_per[2]

    @yes_stra_per = Field.deb(@scores,@yesterday,"ストラテジ系")
    @yes_mana_per = Field.deb(@scores,@yesterday,"マネジメント系")
    @yes_tec_per = Field.deb(@scores,@yesterday,"テクノロジ系")

    gon.yes_stra_per = @yes_stra_per[2]
    gon.yes_mana_per = @yes_mana_per[2]
    gon.yes_tec_per = @yes_tec_per[2]

    @calenders = User.find(params[:id]).calenders.where(created_at: @day.in_time_zone.all_day)

    @study_time = 0
    @break_time = 0
    @calenders.each do |calender|
      @study_time += calender.study_time 
      @break_time += calender.break_time
    end

    @study_hour = (@study_time / 3600.0).floor
    @study_minite = ((@study_time / 60.0) % 60).floor
    @study_second  =  (@study_time % 60.0).floor

    @break_hour = (@break_time / 3600.0).floor
    @break_minite = ((@break_time / 60.0) % 60).floor
    @break_second  =  (@break_time % 60.0).floor

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

    @questions = User.find(params[:id]).scores.where(study_day:@day)

  end
end
