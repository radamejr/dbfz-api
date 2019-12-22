class CreateVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :variants do |t|
      t.string :type
      t.integer :startup
      t.integer :recovery
      t.integer :active
      t.integer :advantage
      t.integer :immune_to
      t.integer :meter_used
      t.string :gaurd
      t.string :properties
      t.string :special_notes
      t.integer :special_id
      t.string :picture
      t.timestamps
    end
  end
end
