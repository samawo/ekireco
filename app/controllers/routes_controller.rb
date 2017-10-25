class RoutesController < ApplicationController
  def index
    @routes=Route.all
  end

  def show
    @route=Route.find(params[:id])
    @stations=@route.stations
  end
end
