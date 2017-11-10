class PrefecturesController < ApplicationController
  def index
    @search = Prefecture.search(params[:q]) # この行を追加
    @prefectures = @search.result #この行を修正
    #@prefectures=Prefecture.all
    @prefectures=@prefectures.sort{|a,b| a.id<=>b.id}
  end

  def show
    @prefecture=Prefecture.find(params[:id])
    @stations=@prefecture.stations.sort{|a,b| a.id<=>b.id}
    @routes=@prefecture.routes.sort{|a,b| a.id<=>b.id}
    @prefecture_comment=@prefecture.prefecture_comments.build
    @prefecture_comments=@prefecture.prefecture_comments
  end
end
