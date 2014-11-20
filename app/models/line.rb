class Line < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title,
    presence: true,
    length: { minimum: 2 },
    allow_blank: false,
    uniqueness: true

  has_many :ship
end
