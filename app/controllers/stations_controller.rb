class StationsController < ApplicationController
  def index
    @stations=Station.all
    @stations=@stations.sort{|a,b| a.id<=>b.id}
  end

  def show
    @station=Station.find(params[:id])
    @routes=@station.routes
    @prefecture=@station.prefecture
    @station_comment=@station.station_comments.build
    @station_comments=@station.station_comments
  end
end
