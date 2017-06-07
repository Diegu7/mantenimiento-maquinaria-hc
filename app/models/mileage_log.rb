class MileageLog < ApplicationRecord
     belongs_to :machine
     
     validates_presence_of :date, :hours, :machine

     validates :hours, numericality:  { greater_than_or_equal_to: 0 }
end
