class RenameBooleanColumns < ActiveRecord::Migration[5.1]
  def change
    rename_column :programmed_maintenances, :done?, :done
    rename_column :programmed_maintenances, :preventive?, :preventive 
    rename_column :maintenance_plans, :done?, :done
  end
end
