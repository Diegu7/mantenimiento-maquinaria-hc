module MileageLogsHelper
    def spanish_date(date)
        return nil unless date
        l date, format: "%e de %B de %Y, %I:%M %p"
    end
end
