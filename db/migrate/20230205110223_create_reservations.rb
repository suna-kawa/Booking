class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.date :check_in, null: false
      t.date :check_out, null: false
      t.integer :guest, null: false
      t.references :user
      t.references :room
      t.timestamps
    end
  end
end
