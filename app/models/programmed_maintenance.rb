class ProgrammedMaintenance < ApplicationRecord
   before_save :default_values

   belongs_to :machine
   #belongs_to :required_maintenance

   has_many :materials_for_maintenances, inverse_of: :programmed_maintenance, dependent: :destroy
   accepts_nested_attributes_for :materials_for_maintenances, reject_if: :all_blank, allow_destroy: true

   validates_presence_of :estimated_duration, :comments
   #, :materials_for_maintenances

   validates :estimated_duration, numericality:  { greater_than: 0 }

   scope :pending, -> { where(done: false) }

   def default_values
      self.description ||= 'Correctivo'
      self.scheduled_at ||= Date.today
      self.preventive ||= false
   end
end
