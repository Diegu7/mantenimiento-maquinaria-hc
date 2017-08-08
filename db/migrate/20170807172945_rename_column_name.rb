class RenameColumnName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :maintenance_notifications, :required_maintenance_id	, :programmed_maintenance_id
  end
end
