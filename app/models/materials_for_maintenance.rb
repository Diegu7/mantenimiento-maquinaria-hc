class MaterialsForMaintenance < ApplicationRecord
    belongs_to :programmed_maintenance
    belongs_to :product
    has_one :product_durability

    validates_presence_of :used_quantity

    validates :used_quantity, numericality:  { greater_than: 0 }
end
