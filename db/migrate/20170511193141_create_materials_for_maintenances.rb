class CreateMaterialsForMaintenances < ActiveRecord::Migration[5.1]
  def change
    create_table :materials_for_maintenances do |t|
      t.integer :used_quantity
      
      t.references :programmed_maintenance, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
