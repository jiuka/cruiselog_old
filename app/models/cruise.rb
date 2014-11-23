class Cruise < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :embark, class_name: 'PortOfCall'
  belongs_to :disembark, class_name: 'PortOfCall'

  belongs_to :ship
  has_many :segments, class_name: 'CruiseSegment'

  def slug_candidates
    [
      [ship.title, :title],
      [ship.title, :title, :id],
    ]
  end

  def ports
    itinerary.map { |poc| p.port }
  end

  def itinerary
    if embark && disembark
      ship.port_of_call.where("leave >= :embark and arrive <= :disembark",
                       {embark: embark.leave, disembark: disembark.arrive}).order(:orderdate)
    else
      []
    end
  end

end
