class CreateMachineCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :machine_categories do |t|
      t.text :name

      t.datetime :registered_at
      t.datetime :changed_at
      t.timestamps
    end
  end
end
