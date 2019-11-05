class CreateSliders < ActiveRecord::Migration[5.2]
  def change
    create_table :sliders do |t|
      t.string :name

      t.timestamps
    end
    add_index :sliders, :name, unique: true
  end
end
