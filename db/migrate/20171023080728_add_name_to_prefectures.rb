class AddNameToPrefectures < ActiveRecord::Migration
  def change
    add_column :prefectures, :name, :string
  end
end
