class ChangeCancellableToString < ActiveRecord::Migration[5.2]
  def change
    change_column :normals, :cancellable, :string
  end
end
