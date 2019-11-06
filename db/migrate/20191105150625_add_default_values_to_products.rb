class AddDefaultValuesToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:products, :price, 0.0)
    change_column_default(:products, :cost, 0.0)
    change_column_default(:products, :active, true)
  end
end
