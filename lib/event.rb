class Event
    def initialize(programmed_maintenance)
        @id = programmed_maintenance.id
        @title = programmed_maintenance.description
        @start = programmed_maintenance.scheduled_at.to_datetime + 8.hour
        @end = @start + programmed_maintenance.estimated_duration.hour

        if DateTime.now < @start
            @color = 'green'
        elsif DateTime.now >= @start || DateTime.now <= @end
            @color = 'yellow'
        else
            @color = 'red'
        end
    end
end