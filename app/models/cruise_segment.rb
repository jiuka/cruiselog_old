class CruiseSegment < ActiveRecord::Base
  belongs_to :cruise
  belongs_to :from, class_name: "Port"
  belongs_to :to, class_name: "Port"
end
