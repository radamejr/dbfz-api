class ChangeIconUrlToIcon < ActiveRecord::Migration[5.2]
  def change
    rename_column :characters, :icon_url, :icon
  end
end
