class CreateStationComments < ActiveRecord::Migration
  def change
    create_table :station_comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :station, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
    end
  end
end
