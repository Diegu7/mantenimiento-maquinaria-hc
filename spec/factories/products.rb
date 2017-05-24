FactoryGirl.define do
    #Factories used for creating Products
    factory :product_brand do
        name "Good Year"
    end
    
    factory :product_category do
        name "Aceites"
    end

    factory :product do
        name "Tornillos"
        initial_stock 0
        current_stock 5
        image "tornillo.jpeg"
        product_brand
        product_category
        minimum 2
        maximum 10
    end

end
