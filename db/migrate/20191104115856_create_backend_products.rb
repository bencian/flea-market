class CreateBackendProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :backend_products do |t|
      t.string :name
      t.string :description
      t.integer :code
      t.float :price
      t.float :cost
      t.boolean :active
      t.references :category, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
    add_index :backend_products, :name, unique: true
    add_index :backend_products, :code, unique: true
  end
end
