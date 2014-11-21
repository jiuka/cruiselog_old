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

end
