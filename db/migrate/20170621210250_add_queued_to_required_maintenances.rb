class AddQueuedToRequiredMaintenances < ActiveRecord::Migration[5.1]
  def change
    add_column :required_maintenances, :queued, :boolean, default: false
  end
end
