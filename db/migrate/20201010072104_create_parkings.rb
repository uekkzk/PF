class CreateParkings < ActiveRecord::Migration[5.2]
  def change
    create_table :parkings do |t|

      t.integer :user_id, null: false
      t.string :parking_name, null: false
      t.integer :postcode
      t.integer :prefecture_code, null: false
      t.string :address, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.string :regular_holiday, null: false
      t.string :fee, null: false
      t.string :tel
      t.string :time
      t.string :restriction
      t.string :capacity
      t.timestamps

    end
  end
end
