class AdjustDatabaseMoves < ActiveRecord::Migration[5.2]
  def change
    add_column :specials, :active, :string
    add_column :supers, :active, :string
    add_column :normals, :type, :string
    
    rename_column :normals, :active_frames, :active

    rename_column :normals, :startup_frames, :startup
    rename_column :supers, :startup_frames, :startup
    rename_column :specials, :startup_frames, :startup
    
  end
end
