class Ship < ActiveRecord::Base
  belongs_to :line
  belongs_to :port_of_origin, class_name: "Port"
end
