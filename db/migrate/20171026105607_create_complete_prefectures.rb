class CreateCompletePrefectures < ActiveRecord::Migration
  def change
    create_table :complete_prefectures do |t|
      t.integer :user_id
      t.integer :prefecture_id
      
      t.timestamps null: false
    end
    
    add_index :complete_prefectures, :user_id
    add_index :complete_prefectures, :prefecture_id
    add_index :complete_prefectures, [:user_id,:prefecture_id],unique: true
  end
end
