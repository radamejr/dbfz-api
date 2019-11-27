class CreateSpecials < ActiveRecord::Migration[5.2]
  def change
    create_table :specials do |t|
      t.string  :name
      t.string  :input 
      t.integer  :startup_frames 
      t.integer  :recovery_on_hit 
      t.integer  :recovery_on_block 
      t.integer  :recovery_on_whiff 
      t.boolean  :cancellable, :default => :false
      t.integer  :blockstun 
      t.string  :immune_to 
      t.integer  :character_id 
      t.integer  :meter_used 
      t.timestamps
    end
  end
end
