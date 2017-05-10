class CreateMachines < ActiveRecord::Migration[5.1]
  def change
    create_table :machines do |t|
      t.text :name
      t.text :tipe
      t.text :brand

      t.timestamps
    end
  end
end
