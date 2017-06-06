class InventoryTransaction < ApplicationRecord
    has_many :inventory_transaction_details, inverse_of: :inventory_transaction
    accepts_nested_attributes_for :inventory_transaction_details, reject_if: :all_blank, allow_destroy: true

    enum transaction_type: [:Entrada, :Salida]
end
