class AddDetailToStation < ActiveRecord::Migration
  def change
    add_column :stations, :station_cord,:integer
    add_column :stations, :station_group_cord,:integer
    add_column :stations, :longitude,:integer
    add_column :stations, :latitude,:integer
    
    
    add_column :routes, :route_cord,:integer
    add_column :routes, :longitude,:integer
    add_column :routes, :latitude,:integer
    
  end
end
