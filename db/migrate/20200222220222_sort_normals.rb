class SortNormals < ActiveRecord::Migration[5.2]
  def change
    add_column :normals, :list_order, :integer
  end
end
