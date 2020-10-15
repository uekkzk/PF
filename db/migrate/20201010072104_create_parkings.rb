class CreateParkings < ActiveRecord::Migration[5.2]
  def change
    create_table :parkings do |t|
      t.integer :user_id, null: false
      t.string :parking_name, null: false
      t.string :address, null: false
      t.string :regular_holiday, null: false
      t.integer :fee, null: false
      t.string :image_id
      t.integer :prefecture, null: false, default: 0

      t.timestamps
    end
  end
end
