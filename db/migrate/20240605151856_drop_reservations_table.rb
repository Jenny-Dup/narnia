class DropReservationsTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :reservations
  end
end
