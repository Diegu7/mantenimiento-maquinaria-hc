FactoryGirl.define do
    factory :postponed_maintenance do
        reason "No dio tiempo"
        previous_date { 1.week.ago }
        new_date { Time.now }
        programmed_maintenance
    end 
end
