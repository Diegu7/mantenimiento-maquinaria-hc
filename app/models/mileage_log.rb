class MileageLog < ApplicationRecord
    belongs_to :machine

    validates_presence_of :date, :hours
    validates :hours, numericality: { greater_than: 0 }
end
