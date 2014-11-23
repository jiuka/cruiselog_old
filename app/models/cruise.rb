class Cruise < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :embark, class_name: 'PortOfCall'
  belongs_to :disembark, class_name: 'PortOfCall'

  belongs_to :ship
  has_many :segments, class_name: 'CruiseSegment'

  validates :ship, presence: true
  validates :embark, presence: true
  validates :disembark, presence: true

  def slug_candidates
    [
      [:ship_title, :title],
      [:ship_title, :title, :id],
    ]
  end

  def ship_title
    ship.try(:title) || nil
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
