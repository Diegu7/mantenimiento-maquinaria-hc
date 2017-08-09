class AddMaterialsForMaintenancesToProductDurabilities < ActiveRecord::Migration[5.1]
  def change
    add_reference :product_durabilities, :materials_for_maintenances, foreign_key: true
  end
end
