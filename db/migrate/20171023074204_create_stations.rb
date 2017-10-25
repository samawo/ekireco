class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.integer :prefecture_id

      t.timestamps null: false
    end
  end
end
