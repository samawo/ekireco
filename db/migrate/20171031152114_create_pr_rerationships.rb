class CreatePrRerationships < ActiveRecord::Migration
  def change
    create_table :pr_relationships do |t|
      t.integer :prefecture_id
      t.integer :route_id

      t.timestamps null: false
    end
    add_index :pr_relationships, :prefecture_id
    add_index :pr_relationships, :route_id
    add_index :pr_relationships, [:prefecture_id, :route_id], unique: true
  end
end
