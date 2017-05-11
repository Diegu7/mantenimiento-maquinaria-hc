class CreatePostponedMaintenanceLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :postponed_maintenance_logs do |t|
      t.text :reason
      t.date :previous_date
      t.date :new_date

      t.references :programmed_maintenance, foreign_key: true

      t.timestamps
    end
  end
end
