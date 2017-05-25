class ProgrammedMaintenance < ApplicationRecord
     belongs_to :machine
     
     has_many :materials_for_maintenances
     has_many :postponed_maintenance_logs     
     
     validates_presence_of :description
     validates_presence_of :scheduled_at
     validates_presence_of :estimated_duration
     validates_presence_of :comments
end
