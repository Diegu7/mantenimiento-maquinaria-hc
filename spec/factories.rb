FactoryGirl.define do
    #factories used for Machines
    factory :machine_area do
        name "Area de Motor"
    end
    
    factory :machine_section do
        name "Desfibrado"
    end
    
    factory :machine do
        name "Tractor"
        machine_section
    end

    #Factories used for creating Products
    factory :product_brand do
        name "Good Year"
    end
    
    factory :product_category do
        name "Aceites"
    end


end
