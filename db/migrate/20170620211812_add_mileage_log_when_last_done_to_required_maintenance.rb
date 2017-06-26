class AddMileageLogWhenLastDoneToRequiredMaintenance < ActiveRecord::Migration[5.1]
  def change
    add_column :required_maintenances, :mileage_when_last_done, :integer
  end
end
