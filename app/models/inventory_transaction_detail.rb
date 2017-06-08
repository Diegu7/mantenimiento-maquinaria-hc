class InventoryTransactionDetail < ApplicationRecord
    belongs_to :inventory_transaction

    validates_presence_of :quantity
   
    validates :quantity, numericality:  { greater_than: 0 }
end
