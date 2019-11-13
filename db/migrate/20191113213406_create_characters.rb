class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string  :name
      t.boolean :dlc, :default => false
      t.string :discord_link
      t.string :combo_doc_link
      t.timestamps
    end
  end
end
