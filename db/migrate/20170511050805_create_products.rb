class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.text :name
      t.integer :initial_stock
      t.integer :current_stock
      t.string :image_url

      t.references :product_category, foreign_key: true
      t.references :product_brand, foreign_key: true

      t.datetime :registered_at
      t.datetime :changed_at
      t.timestamps
    end
  end
end
