class DropMachineCategories < ActiveRecord::Migration[5.1]
  def change
    drop_table :machine_categories
  end
end
