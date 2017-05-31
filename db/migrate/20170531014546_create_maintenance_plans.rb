class CreateMaintenancePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :maintenance_plans do |t|
      t.string :description
      t.date :scheduled_at
      t.date :done_at
      t.boolean :done?

      t.timestamps
    end
  end
end
