FactoryGirl.define do
  factory :mileage_log do
    date { Time.now }
    hours 20
    machine
  end
end
