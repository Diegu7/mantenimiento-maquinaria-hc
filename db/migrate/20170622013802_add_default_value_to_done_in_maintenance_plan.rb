class AddDefaultValueToDoneInMaintenancePlan < ActiveRecord::Migration[5.1]
  def change
    change_column :maintenance_plans, :done, :boolean, default: false
  end
end
