class PostponedMaintenanceLog < ApplicationRecord
     belongs_to :programmed_maintenance

     validates_presence_of :reason
     validates_presence_of :previous_date
     validates_presence_of :new_date
end
