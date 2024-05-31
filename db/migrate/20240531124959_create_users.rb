class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :location
      t.text :bio
      t.float :rating

      t.timestamps
    end
  end
end
