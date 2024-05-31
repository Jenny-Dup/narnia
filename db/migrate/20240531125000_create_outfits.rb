class CreateOutfits < ActiveRecord::Migration[7.1]
  def change
    create_table :outfits do |t|
      t.string :name
      t.text :description
      t.string :location
      t.integer :lender_id
      t.decimal :price

      t.timestamps
    end
  end
end
