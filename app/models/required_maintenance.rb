class RequiredMaintenance < ApplicationRecord
     belongs_to :machine
     belongs_to :area
     
     validates_presence_of :description
     validates_presence_of :estimated_duration
end
