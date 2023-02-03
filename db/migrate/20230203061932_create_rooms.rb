class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :hotel_image
      t.string :hotel_name
      t.text :hotel_introduction
      t.integer :price
      t.string :address

      t.timestamps
    end
  end
end
