class AddDefaultValueToDoneInProgrammedMaintenances < ActiveRecord::Migration[5.1]
  def change
    change_column :programmed_maintenances, :done, :boolean, default: true
  end
end
