class PrefecturesController < ApplicationController
  def index
    @prefectures=Prefecture.all
    @prefectures=@prefectures.sort{|a,b| a.id<=>b.id}
  end

  def show
    @prefecture=Prefecture.find(params[:id])
    @stations=@prefecture.stations
    @prefecture_comment=@prefecture.prefecture_comments.build
    @prefecture_comments=@prefecture.prefecture_comments
  end
end
