class PortOfCall < ActiveRecord::Base
  belongs_to :ship
  belongs_to :port

  validates :ship, presence: true
  validates :port, presence: true
  validates :arrive, presence: true
  validates :leave, presence: true
  validates :arrive , date: { before: :leave }

  def arrive=(s)
    Time.use_zone(port.try(:tz) || 'UTC') do
      self[:arrive] = Time.zone.parse s
      updateOrderDate
    end
  end

  def arrive
    if self[:arrive]
      self[:arrive].in_time_zone(port.try(:tz) || 'UTC')
    else
      self[:arrive]
    end
  end

  def leave=(s)
    Time.use_zone(port.try(:tz) || 'UTC') do
      self[:leave] = Time.zone.parse s
      updateOrderDate
    end
  end

  def leave
    if self[:leave]
      self[:leave].in_time_zone(port.try(:tz) || 'UTC')
    else
      nil
    end
  end

  def title
    "#{port.title} - #{ship.title} - #{arrive}"
  end

  private
  def updateOrderDate
    self[:orderdate] = self.arrive || self.leave
  end

end
