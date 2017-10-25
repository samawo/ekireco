class AddActivToStations < ActiveRecord::Migration
  def change
    add_column :stations, :active, :boolean, default: true
  end
end
