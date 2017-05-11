class CreateMileageLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :mileage_logs do |t|
      t.datetime :date
      t.integer :hours
      
      t.references :machine, foreign_key: true

      t.datetime :registered_at
      t.datetime :changed_at
      t.timestamps
    end
  end
end
