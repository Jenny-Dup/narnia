class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.integer :outfit_id
      t.float :rating
      t.date :date
      t.integer :renter_id

      t.timestamps
    end
  end
end
