class CreateRouteComments < ActiveRecord::Migration
  def change
    create_table :route_comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :route, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
    end
  end
end
