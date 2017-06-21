class RequiredMaintenance < ApplicationRecord
     before_save :fill_nil_values
     belongs_to :machine
     belongs_to :machine_area

     has_many :programmed_maintenances

     validates_presence_of :description, :machine, :machine_area, :frequency_in_hours, :frequency_in_days

     validates :mileage_when_last_done, :frequency_in_hours, :frequency_in_days, numericality: { greater_or_equal_than: 0 }     
     validates :estimated_duration, numericality:  { greater_than: 0 }

     def fill_nil_values
        if self.frequency_in_days == nil
             self.frequency_in_days = 0
        end

        if self.frequency_in_hours == nil
             self.frequency_in_hours = 0
        end

        if self.mileage_when_last_done == nil
             self.mileage_when_last_done = 0
        end
     end
        
end
