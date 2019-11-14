class AddDataToSupers < ActiveRecord::Migration[5.2]
  def change
    add_column :supers, :name, :string
    add_column :supers, :input, :string
    add_column :supers, :startup_frames, :integer
    add_column :supers, :recovery_on_hit, :integer
    add_column :supers, :recovery_on_block, :integer
    add_column :supers, :recovery_on_whiff, :integer
    add_column :supers, :cancellable, :string
    add_column :supers, :blockstun, :integer
    add_column :supers, :immune_to, :string
    add_column :supers, :character_id, :integer

  end
end
