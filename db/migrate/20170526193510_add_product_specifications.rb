class AddProductSpecifications < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :specifications, :string
  end
end
