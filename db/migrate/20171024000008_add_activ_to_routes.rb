class AddActivToRoutes < ActiveRecord::Migration
  def change
    add_column :routes, :active, :boolean, default: true
  end
end
