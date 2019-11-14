class ChangeCancellableDefault < ActiveRecord::Migration[5.2]
  def change
    change_column :normals, :cancellable, :string, :default => ""
  end
end
