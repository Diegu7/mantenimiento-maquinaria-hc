class CreateRequiredMaintenances < ActiveRecord::Migration[5.1]
  def change
    create_table :required_maintenances do |t|
      t.text :description
      t.integer :estimated_duration

      t.references :machine, foreign_key: true
      t.references :machine_area, foreign_key: true

      t.timestamps
    end
  end
end
