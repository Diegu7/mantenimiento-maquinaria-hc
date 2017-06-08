FactoryGirl.define do
    factory :materials_for_maintenance do
        used_quantity 10
        programmed_maintenance
        product
    end
end
