class AddPhotoToOutfits < ActiveRecord::Migration[7.1]
  def change
    add_column :outfits, :photo, :string
  end
end
