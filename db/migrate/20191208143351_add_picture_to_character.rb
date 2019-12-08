class AddPictureToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :character_picture, :string
  end
end
