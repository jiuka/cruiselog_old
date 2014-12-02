class Passenger < ActiveRecord::Base
  include Clearance::User
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  has_many :cruise
  
  def slug_candidates
    [
      :fullname,
      [:firstname, :lastname],
    ]
  end

  def fullname
    self[:fullname] || "#{firstname} #{lastname}"
  end

  def captain?
    return self[:captain]
  end

end
