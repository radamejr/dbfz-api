class AddCharacterIdToNormals < ActiveRecord::Migration[5.2]
  def change
    add_column :normals, :character_id, :integer
  end
end
