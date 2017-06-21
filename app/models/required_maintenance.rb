class RequiredMaintenance < ApplicationRecord
     before_save :fill_nil_values
     after_save :update_programmed_maintenances
     after_initialize :fill_nil_values
     belongs_to :machine
     belongs_to :machine_area

     has_many :programmed_maintenances

     validates_presence_of :description, :machine, :machine_area, :frequency_in_hours, :frequency_in_days

     validates :estimated_duration, :mileage_when_last_done, :frequency_in_hours, :frequency_in_days, numericality: { greater_or_equal_than: 0 }     

     validates :mileage_when_last_done, :frequency_in_hours, :frequency_in_days, numericality: { greater_or_equal_than: 0 }     
     validates :estimated_duration, numericality:  { greater_than: 0 }


     #This should be a query
     def self.coming_soon
         RequiredMaintenance.where(queued: false).select{ |m| m.last_time_done_at + m.frequency_in_days < Date.today + 5.day  }
     end

     def self.create_programmed_maintenances
        required_maintenances = RequiredMaintenance.coming_soon

        required_maintenances.each do |required_maintenance|
        programmed_maintenance = required_maintenance.new_programmed_maintenance
        programmed_maintenance.save

        required_maintenance.update_attributes(queued: true)
        end
     end

     def new_programmed_maintenance
         programmed_maintenances.build(
             description: description,
             estimated_duration: estimated_duration,
             comments: description,
             preventive: true,
             done: false,
             machine: machine,
             scheduled_at: last_time_done_at.to_datetime + frequency_in_days + 8.hour
        )
     end

     def fill_nil_values
        if self.frequency_in_days == nil
             self.frequency_in_days = 0
        end

        if self.frequency_in_hours == nil
             self.frequency_in_hours = 0
        end
    end

     def fill_nil_values
        self.frequency_in_days ||= 0
        self.frequency_in_hours ||= 0
        self.mileage_when_last_done ||= 0
     end

     def update_programmed_maintenances
         RequiredMaintenance.create_programmed_maintenances
     end
end
