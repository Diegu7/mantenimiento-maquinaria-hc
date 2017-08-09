class AddColumnToMaintenanceNotifications < ActiveRecord::Migration[5.1]
  def change
  	add_column :maintenance_notifications, :required_maintenance_id, :numeric
  end
end
