class CreateInventoryTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :inventory_transactions do |t|
      t.date :done_at
      t.column :transaction_type, :integer, default: 0

      t.timestamps
    end
  end
end
