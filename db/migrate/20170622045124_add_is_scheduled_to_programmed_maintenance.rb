class AddIsScheduledToProgrammedMaintenance < ActiveRecord::Migration[5.1]
  def change
    add_column :programmed_maintenances, :scheduled, :boolean, default: false
  end
end
