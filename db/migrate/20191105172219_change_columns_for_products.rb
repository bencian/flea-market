class ChangeColumnsForProducts < ActiveRecord::Migration[5.2]
  def change
    change_column(:products, :price, :decimal, null: false)
    change_column(:products, :cost, :decimal, null: false)
  end
end
