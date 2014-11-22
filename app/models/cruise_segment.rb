class CruiseSegment < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :scoped, :scope => :cruise

  belongs_to :cruise
  belongs_to :from, class_name: "Port"
  belongs_to :to, class_name: "Port"

  def slug_candidates
    [
      [from.title, to.title],
    ]
  end

  def route=(s)
    f = RGeo::Geographic.spherical_factory(:srid => 4326)
    self[:route] = f.line_string(s.scan(/LatLng\(([0-9\.\-]+), ([0-9\.\-]+)\)/).map do |lat,lon|
      f.point(lat, lon)
    end)
  end

  def route
    if self[:route]
      [[self.from.latitude, self.from.longitude]] +
        self[:route].points[1, self[:route].points.length-2].map { |p| [p.x, p.y] } +
        [[self.to.latitude, self.to.longitude]]
    else
     [
       [self.from.latitude, self.from.longitude],
       [self.to.latitude, self.to.longitude],
     ]
    end
  end
end

