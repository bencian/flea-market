class CreateFrontendConfigurations < ActiveRecord::Migration[5.2]
  def change
    create_table :frontend_configurations do |t|
      t.integer :singleton_guard

      t.timestamps
    end
    add_index(:frontend_configurations, :singleton_guard, unique: true)
  end
end
