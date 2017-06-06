class InventoryTransaction < ApplicationRecord
    has_many :inventory_transaction_details

    enum transaction_type: [:Entrada, :Salida]
end
