class StationsController < ApplicationController
  def index
    @stations=Station.all
  end

  def show
    @station=Station.find(params[:id])
    @routes=@station.routes
    @prefecture=@station.prefecture
  end
end
