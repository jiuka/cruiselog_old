class Cruise < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :ship
  has_many :segments, class_name: 'CruiseSegment'

  def slug_candidates
    [
      [ship.title, :title],
      [ship.title, :title, :id],
    ]
  end

  def ports
    [self.segments[0].from] + self.segments.map { |p| p.to }
  end

end
