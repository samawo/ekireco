class StationsController < ApplicationController
  def index
    @stations=Station.all
  end

  def show
    @station=Station.find(params[:id])
    @routes=@station.routes
    @prefecture=@station.prefecture
    @station_comment=@station.station_comments.build
    @station_comments=@station.station_comments
  end
end
