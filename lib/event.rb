class Event
    def initialize(programmed_maintenance)
        @id = programmed_maintenance.id
        @title = programmed_maintenance.description
        @start = programmed_maintenance.scheduled_at
        @end = @start + programmed_maintenance.estimated_duration.day
        @url = Rails.application.routes.url_helpers.programmed_maintenance_path(programmed_maintenance)
    end
end