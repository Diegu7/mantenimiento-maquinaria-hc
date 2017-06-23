class MileageLog < ApplicationRecord
    belongs_to :machine
    after_save :generate_programmed_maintenace

    validates_presence_of :date, :hours
    validates :hours, numericality: { greater_than: 0 }

    def generate_programmed_maintenace
        @required_maintenances = self.machine.required_maintenances
        
        @required_maintenances.each  do |maintenance|
            if maintenance.frequency_in_hours > 0
                @mileage_when_last_done = maintenance.mileage_when_last_done
                @current_mileage = self.machine.total_hours
                @maintenance = RequiredMaintenance.find(maintenance.id)

                puts "ANTES DEL IF"

                if (@current_mileage - @mileage_when_last_done) >= maintenance.frequency_in_hours
                    # Validate if already exists a programmed maintenance for this required maintenance in this machine
                    if !(ProgrammedMaintenance.exists?(required_maintenance_id: maintenance.id, scheduled: false))                        
                        programmed = ProgrammedMaintenance.new
                        programmed.description = maintenance.description
                        programmed.scheduled_at = Date.today
                        programmed.estimated_duration = maintenance.estimated_duration
                        programmed.comments = "."
                        programmed.done_at = 1.day.from_now
                        programmed.preventive ||= true
                        programmed.machine = self.machine
                        programmed.required_maintenance_id = @maintenance.id
                        programmed.save!
                        ProgrammedMaintenance.where(id: programmed.id).update_all(done: false)
                    end
                end
            end
        end
    end
end
