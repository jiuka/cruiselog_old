class Route < ActiveRecord::Base
  belongs_to :from, class_name: "Port"
  belongs_to :to, class_name: "Port"

  def line=(s)
    f = RGeo::Geographic.spherical_factory(:srid => 4326)
    self[:line] = f.line_string(s.scan(/LatLng\(([0-9\.\-]+), ([0-9\.\-]+)\)/).map do |lat,lon|
      f.point(lat, lon)
    end)
  end

  def line
    if self[:line] and self[:line].points.length > 2
      [[self.from.latitude, self.from.longitude]] +
        self[:line].points[1, self[:line].points.length-2].map { |p| [p.x, p.y] } +
        [[self.to.latitude, self.to.longitude]]
    else
      [
        [self.from.latitude, self.from.longitude],
        [self.to.latitude, self.to.longitude],
      ]
    end
  end
end
