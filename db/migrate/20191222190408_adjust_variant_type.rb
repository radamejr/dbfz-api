class AdjustVariantType < ActiveRecord::Migration[5.2]
  def change
    rename_column :variants, :type, :input_type
  end
end
