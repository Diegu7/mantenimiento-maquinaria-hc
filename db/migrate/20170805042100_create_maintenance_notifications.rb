class CreateMaintenanceNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :maintenance_notifications do |t|
      t.string :name
      t.string :type
      t.text :description
      t.date :schedule_at

      t.timestamps
    end
  end
end
