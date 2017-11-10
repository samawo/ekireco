class RoutesController < ApplicationController
  def index
    @search=Route.search(params[:q])
    @routes=@search.result
    # @routes=Route.all
    @routes=@routes.sort{|a,b| a.id<=>b.id}
  end

  def show
    @route=Route.find(params[:id])
    @stations=@route.stations.sort{|a,b| a.id<=>b.id}
    @route_comment=@route.route_comments.build
    @route_comments=@route.route_comments
  end
end
