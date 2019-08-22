class MypagesController < ApplicationController
  def show
    @scores = User.find(params[:id]).scores

    ans = @scores.where(answer:"○").size
    total = @scores.size
    @per = ((ans / total.to_f) * 100).floor

    @level = (ans / 50).floor

    @calenders = User.find(params[:id]).calenders
    @all_study_time = 0
    @all_break_time = 0
    @calenders.each do |calender|
      @all_study_time += calender.study_time 
      @all_break_time += calender.break_time
    end


    @study_hour = (@all_study_time / 3600.0).floor
    @study_minite = ((@all_study_time / 60.0) % 60).floor
    @study_second  =  (@all_study_time % 60.0).floor

    @break_hour = (@all_break_time / 3600.0).floor
    @break_minite = ((@all_break_time / 60.0) % 60).floor
    @break_second  =  (@all_break_time % 60.0).floor


    
    arry = []
    @su = []
    @mu = []
    goods = Field.sepa(@scores,"fin_field")
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
