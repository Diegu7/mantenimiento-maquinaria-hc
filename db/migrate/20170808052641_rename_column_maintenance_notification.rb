class RenameColumnMaintenanceNotification < ActiveRecord::Migration[5.1]
  def change
  	  	rename_column :maintenance_notifications, :name	, :machine_name
  end
end
