class CreateProgrammedMaintenances < ActiveRecord::Migration[5.1]
  def change
    create_table :programmed_maintenances do |t|
      t.text :description
      t.date :scheduled_at
      t.integer :estimated_duration
      t.text :comments
      t.boolean :done?
      t.date :done_at
      t.boolean :preventive?

      t.references :machine, foreign_key: true

      t.timestamps
    end
  end
end
