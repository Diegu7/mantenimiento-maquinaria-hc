class CreateMachines < ActiveRecord::Migration[5.1]
  def change
    create_table :machines do |t|
      t.name :text
      t.tipe :text
      t.marca :text

      t.timestamps
    end
  end
end
