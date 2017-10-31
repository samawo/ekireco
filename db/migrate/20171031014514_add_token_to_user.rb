class AddTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :token, :string, null: false, default: ""
    add_column :users, :secret, :string, null: false, default: ""
  end
end
