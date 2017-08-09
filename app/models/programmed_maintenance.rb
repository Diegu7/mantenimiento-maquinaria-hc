class ProgrammedMaintenance < ApplicationRecord
   before_save :default_values
   after_create :create_maintenance_notifications
   after_update :update_maintenance_notifications
   belongs_to :machine

   has_many :maintenance_notifications

   has_and_belongs_to_many :maintenance_plans, dependent: :destroy

   has_many :materials_for_maintenances, inverse_of: :programmed_maintenance, dependent: :destroy
   accepts_nested_attributes_for :materials_for_maintenances, reject_if: :all_blank, allow_destroy: true

   validates_presence_of :estimated_duration, :comments

   validates :estimated_duration, numericality:  { greater_than: 0 }

   scope :pending, -> { where(done: false, preventive: true) }

  def self.coming_soon
      ProgrammedMaintenance.select{ |m| m.scheduled_at < Date.today + 7.day  }
  end

   def default_values
      self.description ||= 'Correctivo'
      self.scheduled_at ||= Date.today
      self.preventive ||= false
   end

  def full_description
    description << '  Maquina:  ' << machine.name << '  Duración aprox.:  '  << estimated_duration.to_s
   end


   def self.create_maintenance_notifications
        programmed_maintenances = ProgrammedMaintenance.coming_soon

        programmed_maintenances.each do |programmed_maintenance|
        maintenance_notification = programmed_maintenance.new_maintenance_notification
        maintenance_notification.save
        end
    end

    def new_maintenance_notification
        maintenance_notifications.build(
            machine_name: machine.name,
            description: description,
            scheduled_at: scheduled_at,
            programmed_maintenance_id: id,
            remaining_days: scheduled_at
        )
    end

    def create_maintenance_notifications
        ProgrammedMaintenance.create_maintenance_notifications
    end

    def update_maintenance_notifications
        ProgrammedMaintenance.create_maintenance_notifications
    end

end
