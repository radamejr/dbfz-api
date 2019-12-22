class CreateAssists < ActiveRecord::Migration[5.2]
  def change
    create_table :assists do |t|
      t.integer :startup
      t.integer :blockstun
      t.integer :active
      t.integer :onscreen
      t.integer :hitstop_block
      t.integer :hitstop_hit
      t.string :special_notes
      t.integer :character_id
      t.string :picture
      t.timestamps
      t.timestamps
    end
  end
end
