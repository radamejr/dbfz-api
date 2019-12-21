class AddToColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :twitter_tag, :string
  end
end
