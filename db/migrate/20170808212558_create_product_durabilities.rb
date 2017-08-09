class CreateProductDurabilities < ActiveRecord::Migration[5.1]
  def change
    create_table :product_durabilities do |t|
      t.string :product
      t.integer :durabilidad

      t.timestamps
    end
  end
end
