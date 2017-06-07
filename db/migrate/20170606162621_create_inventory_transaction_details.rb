class CreateInventoryTransactionDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :inventory_transaction_details do |t|
      t.integer :quantity

      t.references :inventory_transaction, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
