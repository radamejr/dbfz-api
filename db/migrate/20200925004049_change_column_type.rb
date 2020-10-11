class ChangeColumnType < ActiveRecord::Migration[5.2]
  def change
    change_column :assists, :startup, :string
    change_column :assists, :blockstun, :string
    change_column :assists, :active, :string
    change_column :assists, :onscreen, :string
    change_column :assists, :hit_stun, :string

    change_column :normals, :startup, :string
    change_column :normals, :recovery, :string
    change_column :normals, :advantage, :string
    change_column :normals, :active, :string

    change_column :special_variants, :startup, :string
    change_column :special_variants, :recovery, :string
    change_column :special_variants, :advantage, :string
    change_column :special_variants, :active, :string

    change_column :super_variants, :startup, :string
    change_column :super_variants, :recovery, :string
    change_column :super_variants, :advantage, :string
    change_column :super_variants, :active, :string

    change_column :supers, :startup, :string
    change_column :supers, :recovery, :string
    change_column :supers, :advantage, :string
  
  end
end
