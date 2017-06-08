class MaterialsForMaintenance < ApplicationRecord
    belongs_to :programmed_maintenance
    belongs_to :product

    validates_presence_of :used_quantity, :product,:programmed_maintenance

    validates :used_quantity, numericality:  { greater_than_or_equal_to: 0 }

end
