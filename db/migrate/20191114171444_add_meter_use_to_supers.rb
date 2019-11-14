class AddMeterUseToSupers < ActiveRecord::Migration[5.2]
  def change
     
    add_column :supers, :meter_used, :integer
  end
end
