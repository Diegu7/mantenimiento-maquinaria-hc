class ProgrammedMaintenance < ApplicationRecord
     #
     belongs_to :machine
     
     validates_presence_of :description
     validates_presence_of :scheduled_date
     validates_presence_of :estimated_duration
     validates_presence_of :comments
end
