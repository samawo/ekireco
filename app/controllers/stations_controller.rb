class StationsController < ApplicationController
  def index
    @search = Station.search(params[:q]) # この行を追加
    @stations = @search.result #この行を修正
    # @stations=Station.all
    @stations=@stations.sort{|a,b| a.id<=>b.id}
  end

  def show
    @station=Station.find(params[:id])
    @routes=@station.routes.sort{|a,b| a.id<=>b.id}
    @prefecture=@station.prefecture
    @station_comment=@station.station_comments.build
    @station_comments=@station.station_comments
  end
end
