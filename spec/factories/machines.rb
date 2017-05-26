FactoryGirl.define do    
    #factories used for Machines    
    factory :machine_section do
        name "Desfibrado"
    end
    
    factory :machine do
        name "Tractor"
        image "tractor.jpeg"
        machine_section
    end
end
