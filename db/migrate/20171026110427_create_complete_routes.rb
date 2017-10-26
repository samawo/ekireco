class CreateCompleteRoutes < ActiveRecord::Migration
  def change
    create_table :complete_routes do |t|
      t.integer :user_id
      t.integer :route_id
      
      t.timestamps null: false
    end
    
    add_index :complete_routes, :user_id
    add_index :complete_routes, :route_id
    add_index :complete_routes, [:user_id,:route_id],unique: true
  end
end
