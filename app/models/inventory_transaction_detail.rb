class InventoryTransactionDetail < ApplicationRecord
    belongs_to :inventory_transaction
    belongs_to :product

    validates_presence_of :quantity, :product,:inventory_transaction

    validates :quantity, numericality:  { greater_than_or_equal_to: 0 }
end
