FactoryGirl.define do
    factory :programmed_maintenance do
        description "Limpieza de motor"
        scheduled_at { Time.now }
        estimated_duration 1
        comments "Sin comentarios"
        done true
        done_at { Time.now }
        preventive false
        machine
    end
end
