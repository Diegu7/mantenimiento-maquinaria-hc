class RequiredMaintenance < ApplicationRecord
     belongs_to :machine
     belongs_to :
     
     has_many :programmed_maintenances

     validates_presence_of :description, :machine, :machine_area, :estimated_duration, :frequency_in_hours, :frequency_in_days

     validates :estimated_duration, :frequency_in_hours, :frequency_in_days, numericality:  { greater_than_or_equal_to: 0 }
end
