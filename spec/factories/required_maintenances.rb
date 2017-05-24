FactoryGirl.define do
    factory :required_maintenance do
        description "Cambio de aceite"
        estimated_duration 1
        machine
        machine_area
        frequency_in_hours 2000
        frequency_in_days 2
    end 
end
