class AddNumberToComplete < ActiveRecord::Migration
  def change
    add_column :complete_prefectures,:complete,:boolean,default: false
    add_column :complete_routes,:complete,:boolean,default: false
    add_column :complete_prefectures,:number,:integer
    add_column :complete_routes,:number,:integer
  end
end
