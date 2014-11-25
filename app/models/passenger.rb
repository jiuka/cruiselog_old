class Passenger < ActiveRecord::Base
  include Clearance::User
end
