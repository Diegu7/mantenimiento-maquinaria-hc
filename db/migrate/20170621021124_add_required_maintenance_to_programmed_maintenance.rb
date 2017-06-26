class AddRequiredMaintenanceToProgrammedMaintenance < ActiveRecord::Migration[5.1]
  def change
    add_reference :programmed_maintenances, :required_maintenance, foreign_key: true
  end
end
