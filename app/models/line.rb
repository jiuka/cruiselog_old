class Line < ActiveRecord::Base
  validates :title,
    presence: true,
    length: { minimum: 2 },
    allow_blank: false,
    uniqueness: true
end
