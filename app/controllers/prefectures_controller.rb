class PrefecturesController < ApplicationController
  def index
    
    # http://nekorails.hatenablog.com/entry/2017/05/31/173925#第2章-シンプルモードで検索する
    
    if params[:q] != nil
      params[:q]['name_cont_all'] = params[:q]['name_cont_all'].split(/[\p{blank}\s]+/)
      @search = Prefecture.ransack(params[:q]) # この行を追加
      @prefectures = @search.result #この行を修正
    else
      @search = Prefecture.ransack(params[:q]) # この行を追加
      @prefectures = @search.result #この行を修正
    end
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
