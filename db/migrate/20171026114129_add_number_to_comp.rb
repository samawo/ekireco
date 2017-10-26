class AddNumberToComp < ActiveRecord::Migration
  def change
    change_column :complete_prefectures,:number,:integer,default: 0
    change_column :complete_routes,:number,:integer,default: 0
  end
end
