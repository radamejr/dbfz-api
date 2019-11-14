class CreateNormals < ActiveRecord::Migration[5.2]
  def change
    create_table :normals do |t|
      t.string :input
      t.integer :startup_frames
      t.integer :active_frames
      t.integer :recovery_on_hit
      t.integer :recovery_on_block
      t.integer :recovery_on_whiff
      t.boolean :cancellable, :default => :true
      t.integer :blockstun
      t.string :immune_to
      t.timestamps
    end
  end
end
