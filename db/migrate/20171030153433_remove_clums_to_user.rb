class RemoveClumsToUser < ActiveRecord::Migration
  def change
    remove_column :users, :token
    remove_column :users, :sercret
  end
end
