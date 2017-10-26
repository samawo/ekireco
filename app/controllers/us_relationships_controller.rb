class UsRelationshipsController < ApplicationController
  before_action :authenticate_user!
  respond_to :js
  
  def create
    @station=Station.find(params[:us_relationship][:station_id])
    current_user.access!(@station)
    respond_with @station
  end

  def destroy
    @station=UsRelationship.find(params[:id]).station
    current_user.unaccess!(@station)
    respond_with @station
  end
end
