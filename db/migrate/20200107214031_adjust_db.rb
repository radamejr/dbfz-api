class AdjustDb < ActiveRecord::Migration[5.2]
  def change
    change_column :variants, :immune_to, :string

    add_column :assists, :hit_stun, :integer
    
    add_column :supers, :raw_damage, :integer
    add_column :supers, :scaled_damage, :integer


  end
end
