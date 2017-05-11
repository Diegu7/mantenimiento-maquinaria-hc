class CreateMachines < ActiveRecord::Migration[5.1]
  def change
    create_table :machines do |t|
      t.text :name
     
      t.datetime :registered_at
      t.datetime :changed_at
      t.timestamps
    end
  end
end
