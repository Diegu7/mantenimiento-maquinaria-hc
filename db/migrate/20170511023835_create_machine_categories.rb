class CreateMachineCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :machine_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
