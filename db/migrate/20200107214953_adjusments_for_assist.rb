class AdjusmentsForAssist < ActiveRecord::Migration[5.2]
  def change
    change_column :assists, :hitstop_block, :string

    rename_column :assists, :hitstop_block, :hitstop

    remove_column :assists, :hitstop_hit
  end
end
