class CreateRsRelationships < ActiveRecord::Migration
  def change
    create_table :rs_relationships do |t|
      t.integer :station_id
      t.integer :route_id

      t.timestamps null: false
    end
    add_index :rs_relationships, :station_id
    add_index :rs_relationships, :route_id
    add_index :rs_relationships, [:station_id, :route_id], unique: true
  end
end
