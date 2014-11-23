FactoryGirl.define do
  factory :port_of_call do
    ship
    port
    arrive "2014-11-23 08:40:11"
    leave "2014-11-23 08:40:12"
  end
end
