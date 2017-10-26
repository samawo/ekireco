class UsRelationshipsController < ApplicationController
  before_action :authenticate_user!
  respond_to :js
  
  def create
    @station=Station.find(params[:us_relationship][:station_id])
    current_user.access!(@station)
    
    cp=current_user.complete_prefectures.find_by(prefecture_id: @station.prefecture_id)
    cp.number=cp.number+1
    if cp.number == Prefecture.find(@station.prefecture_id).number
      cp.complete=true
    end
    cp.save
    routes=@station.routes
    routes.each do |route|
      cr=current_user.complete_routes.find_by(route_id: route.id)
      cr.number=cr.number+1
      if cr.number == route.number
        cr.complete=true
      end
      cr.save
    end
    
    respond_with @station
  end

  def destroy
    @station=UsRelationship.find(params[:id]).station
    current_user.unaccess!(@station)
    
    cp=current_user.complete_prefectures.find_by(prefecture_id: @station.prefecture_id)
    cp.number=cp.number-1
    cp.complete=false
    cp.save
    routes=@station.routes
    routes.each do |route|
      cr=current_user.complete_routes.find_by(route_id: route.id)
      cr.number=cr.number-1
      cr.complete=false
      cr.save
    end
    
    respond_with @station
  end
end
