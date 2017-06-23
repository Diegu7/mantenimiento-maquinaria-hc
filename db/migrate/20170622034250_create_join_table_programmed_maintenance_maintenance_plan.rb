class CreateJoinTableProgrammedMaintenanceMaintenancePlan < ActiveRecord::Migration[5.1]
  def change
    create_join_table :programmed_maintenances, :maintenance_plans do |t|
      # t.index [:programmed_maintenance_id, :maintenance_plan_id]
      # t.index [:maintenance_plan_id, :programmed_maintenance_id]
    end
  end
end
