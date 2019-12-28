class AddAboutToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :about, :text
  end
end
