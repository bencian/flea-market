class CreateBackendTags < ActiveRecord::Migration[5.2]
  def change
    create_table :backend_tags do |t|
      t.text :name

      t.timestamps
    end
    add_index :backend_tags, :name, unique: true
  end
end
