class MileageLog < ApplicationRecord
     belongs_to :machine
     
     validates_presence_of :date
     validates_presence_of :hours
     validates :hours, numericality: { greater_than: 0 }
end
