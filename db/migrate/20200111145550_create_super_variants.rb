class CreateSuperVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :super_variants do |t|
      t.string "input_type"
      t.integer "startup"
      t.integer "recovery"
      t.integer "active"
      t.integer "advantage"
      t.string "immune_to"
      t.integer "meter_used"
      t.string "gaurd"
      t.string "properties"
      t.string "special_notes"
      t.integer "super_id"
      t.string "picture"
      t.timestamps
    end

    rename_table :variants, :special_variants
  end
end
