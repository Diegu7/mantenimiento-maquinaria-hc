class RemoveColumnFromMaintenanceNotifications < ActiveRecord::Migration[5.1]
  def change
  	remove_column :maintenance_notifications, :type
  end
end
