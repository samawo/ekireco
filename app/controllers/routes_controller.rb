class RoutesController < ApplicationController
  def index
    if params[:q] != nil
      params[:q]['name_cont_all'] = params[:q]['name_cont_all'].split(/[\p{blank}\s]+/)
      @search = Route.ransack(params[:q]) # この行を追加
      @routes = @search.result #この行を修正
    else
      @search = Route.ransack(params[:q]) # この行を追加
      @routes = @search.result #この行を修正
    end
    @routes=@routes.sort{|a,b| a.id<=>b.id}
  end

  def show
    @route=Route.find(params[:id])
    @stations=@route.stations.sort{|a,b| a.id<=>b.id}
    @route_comment=@route.route_comments.build
    @route_comments=@route.route_comments
  end
end
