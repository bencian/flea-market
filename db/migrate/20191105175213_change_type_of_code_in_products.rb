class ChangeTypeOfCodeInProducts < ActiveRecord::Migration[5.2]
  def change
    change_column(:products, :code, :string)
  end
end
