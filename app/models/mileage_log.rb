class MileageLog < ApplicationRecord
    belongs_to :machine
    after_save :generate_programmed_maintenace

    validates_presence_of :date, :hours
    validates :hours, numericality: { greater_than: 0 }

    def generate_programmed_maintenace
        @required_maintenances = self.machine.required_maintenances
        
        @required_maintenances.each  do |maintenance|
            if maintenance.frequency_in_hours.present?
                @mileage_when_last_done = maintenance.mileage_when_last_done
                @current_mileage = self.machine.total_hours

                if @current_mileage - @mileage_when_last_done >= maintenance.frequency_in_hours
                    puts "MANTENIMIENTO CREADO"
                end
            end
        end
    end
end
