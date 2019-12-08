class AddImagesToMoves < ActiveRecord::Migration[5.2]
  def change
    add_column :normals, :picture, :string
    add_column :supers, :picture, :string
    add_column :specials, :picture, :string

  end
end
