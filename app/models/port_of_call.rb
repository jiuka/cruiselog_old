class PortOfCall < ActiveRecord::Base
  belongs_to :ship
  belongs_to :port

  def arrive=(s)
    self[:arrive] = s
    updateOrderDate
  end

  def leave=(s)
    self[:leave] = s
    updateOrderDate
  end

  private
  def updateOrderDate
    self[:orderdate] = self.arrive || self.leave
  end

end
