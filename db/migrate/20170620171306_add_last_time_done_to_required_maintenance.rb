class AddLastTimeDoneToRequiredMaintenance < ActiveRecord::Migration[5.1]
  def change
     add_column :required_maintenances, :last_time_done_at, :date
  end
end
