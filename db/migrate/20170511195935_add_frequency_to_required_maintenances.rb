class AddFrequencyToRequiredMaintenances < ActiveRecord::Migration[5.1]
  def change
    add_column :required_maintenances, :frequency_in_hours, :decimal
    add_column :required_maintenances, :frequency_in_days, :decimal
  end
end
