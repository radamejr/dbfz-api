class AddIconToCharacter < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :icon_url, :string
  end
end
