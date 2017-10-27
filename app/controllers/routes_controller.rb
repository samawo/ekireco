class RoutesController < ApplicationController
  def index
    @routes=Route.all
  end

  def show
    @route=Route.find(params[:id])
    @stations=@route.stations
    @route_comment=@route.route_comments.build
    @route_comments=@route.route_comments
  end
end
