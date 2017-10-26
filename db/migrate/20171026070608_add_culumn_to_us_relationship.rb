class AddCulumnToUsRelationship < ActiveRecord::Migration
  def change
    remove_column :us_relationships, :route_id
    add_column :us_relationships, :station_id,:integer
    
    #remove_index :us_relationships,:route_id
    #remove_index :us_relationships,:user_id
    #remove_index :us_relationships,[:route_id,:user_id]
    
    add_index :us_relationships,:station_id
    #add_index :us_relationships,:user_id
    add_index :us_relationships,[:user_id,:station_id],unique: true
  end
end
