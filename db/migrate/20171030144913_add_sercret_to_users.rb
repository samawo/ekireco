class AddSercretToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sercret, :string, null: false, default: ""
  end
end
