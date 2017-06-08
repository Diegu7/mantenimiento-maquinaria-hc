class RemoveCategoryFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_reference :products, :product_category, foreign_key: true
  end
end
