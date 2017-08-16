class ChangeColumnNamee < ActiveRecord::Migration[5.1]
  def change
  	rename_column :product_durabilities, :durabilidad, :durability
  end
end
