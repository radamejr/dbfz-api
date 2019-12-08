class AdjustMoveDatabase < ActiveRecord::Migration[5.2]
  def change
    remove_column :normals, :recovery_on_block
    remove_column :normals, :recovery_on_whiff
    remove_column :normals, :cancellable
    rename_column :normals, :recovery_on_hit, :recovery
    rename_column :normals, :blockstun, :advantage
    add_column :normals, :gaurd, :string
    add_column :normals, :properties, :string
    add_column :normals, :special_notes, :text

    remove_column :specials, :recovery_on_block
    remove_column :specials, :recovery_on_whiff
    remove_column :specials, :cancellable
    rename_column :specials, :recovery_on_hit, :recovery
    rename_column :specials, :blockstun, :advantage
    add_column :specials, :gaurd, :string
    add_column :specials, :properties, :string
    add_column :specials, :special_notes, :text

    remove_column :supers, :recovery_on_block
    remove_column :supers, :recovery_on_whiff
    remove_column :supers, :cancellable
    rename_column :supers, :recovery_on_hit, :recovery
    rename_column :supers, :blockstun, :advantage
    add_column :supers, :gaurd, :string
    add_column :supers, :properties, :string
    add_column :supers, :special_notes, :text

  end
end
