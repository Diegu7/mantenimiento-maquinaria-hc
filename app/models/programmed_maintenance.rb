class ProgrammedMaintenance < ApplicationRecord
   before_save :default_values

   belongs_to :machine  
   has_and_belongs_to_many :maintenance_plans, dependent: :destroy

   has_many :materials_for_maintenances, inverse_of: :programmed_maintenance, dependent: :destroy
   accepts_nested_attributes_for :materials_for_maintenances, reject_if: :all_blank, allow_destroy: true

   validates_presence_of :estimated_duration, :comments

   validates :estimated_duration, numericality:  { greater_than: 0 }

   scope :pending, -> { where(done: false, preventive: true) }

   def default_values
      self.description ||= 'Correctivo'
      self.scheduled_at ||= Date.today
      self.preventive ||= false
   end

  def full_description
    description << '  Maquina:  ' << machine.name << '  Duración aprox.:  '  << estimated_duration.to_s
   end
end
