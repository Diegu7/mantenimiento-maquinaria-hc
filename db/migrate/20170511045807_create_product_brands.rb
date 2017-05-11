class CreateProductBrands < ActiveRecord::Migration[5.1]
  def change
    create_table :product_brands do |t|
      t.text :name

      t.datetime :registered_at
      t.datetime :changed_at
      t.timestamps
    end
  end
end
