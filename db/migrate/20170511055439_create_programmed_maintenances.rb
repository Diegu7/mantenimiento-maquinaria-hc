class CreateProgrammedMaintenances < ActiveRecord::Migration[5.1]
  def change
    create_table :programmed_maintenances do |t|
      t.text :description
      t.date :scheduled_date
      t.integer :estimated_duration
      t.text :comments
      t.boolean :is_done
      t.date :done_on
      t.boolean :is_preventive

      t.references :machine, foreign_key: true

      t.datetime :registered_at
      t.datetime :changed_at
      t.timestamps
    end
  end
end
