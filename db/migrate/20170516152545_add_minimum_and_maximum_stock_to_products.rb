class AddMinimumAndMaximumStockToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :minimum, :integer
    add_column :products, :maximum, :integer
  end
end
