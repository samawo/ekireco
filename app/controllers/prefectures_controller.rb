class PrefecturesController < ApplicationController
  def index
    
    # http://nekorails.hatenablog.com/entry/2017/05/31/173925#第2章-シンプルモードで検索する
    @search = Prefecture.search(params[:q]) # この行を追加
    @search.build_condition if @search.conditions.empty?
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
