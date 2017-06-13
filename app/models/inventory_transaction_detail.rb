class InventoryTransactionDetail < ApplicationRecord
    belongs_to :inventory_transaction
    belongs_to :product

    validates_presence_of :quantity
   
    validates :quantity, numericality:  { greater_than: 0 }
end
