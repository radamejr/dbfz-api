class ChangeTypeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :normals, :type, :move_type
  end
end
