class CreateTechnicalSpecifications < ActiveRecord::Migration[5.1]
  def change
    create_table :technical_specifications do |t|
      t.text :key
      t.text :value
      
      t.references :machine, foreign_key: true

      t.datetime :registered_at
      t.datetime :changed_at
      t.timestamps
    end
  end
end
