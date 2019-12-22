class AlterSpecialsTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :specials, :startup
    remove_column :specials, :advantage
    remove_column :specials, :immune_to
    remove_column :specials, :meter_used
    remove_column :specials, :gaurd
    remove_column :specials, :properties
    remove_column :specials, :active
  end
end
