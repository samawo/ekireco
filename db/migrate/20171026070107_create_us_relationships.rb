class CreateUsRelationships < ActiveRecord::Migration
  def change
    create_table :us_relationships do |t|
      t.integer :user_id
      t.integer :route_id

      t.timestamps null: false
    end
    add_index :us_relationships, :user_id
    add_index :us_relationships, :route_id
    add_index :us_relationships,[:user_id, :route_id],unique: true
  end
end
