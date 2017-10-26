class AddVioToUser < ActiveRecord::Migration
  def change
    remove_column :users, :content
    add_column :users, :vio,:string, default: ""
  end
end
