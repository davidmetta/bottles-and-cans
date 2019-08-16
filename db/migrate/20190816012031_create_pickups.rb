class CreatePickups < ActiveRecord::Migration[5.2]
  def change
    create_table :pickups do |t|
      t.references :user, foreign_key: true
      t.integer :collector_id
      t.float :longitude
      t.float :latitude
      t.string :location
      t.integer :bottles
      t.text :info
      t.string :image
      t.string :status, default: 'open'

      t.timestamps
    end
  end
end
