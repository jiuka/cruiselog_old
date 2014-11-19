class Ship < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :line
  belongs_to :port_of_origin, class_name: "Port"

  def slug_candidates
    [
      :title,
      [line.title, :title],
    ]
  end

end
