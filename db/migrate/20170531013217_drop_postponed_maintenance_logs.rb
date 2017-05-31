class DropPostponedMaintenanceLogs < ActiveRecord::Migration[5.1]
  def change
    drop_table :postponed_maintenance_logs
  end
end
