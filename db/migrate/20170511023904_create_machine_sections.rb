class CreateMachineSections < ActiveRecord::Migration[5.1]
  def change
    create_table :machine_sections do |t|
      t.string :name
     
      t.timestamps
    end
  end
end
