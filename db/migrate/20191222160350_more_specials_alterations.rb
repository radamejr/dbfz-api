class MoreSpecialsAlterations < ActiveRecord::Migration[5.2]
  def change
    remove_column :specials, :recovery
  end
end
