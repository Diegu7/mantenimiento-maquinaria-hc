class RequiredMaintenance < ApplicationRecord
     belongs_to :machine
     
     validates_presence_of :description
     validates_presence_of :estimated_duration
end
