class Passenger < ActiveRecord::Base
  include Clearance::User
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  
  def slug_candidates
    [
      :fullname,
      [:firstname, :lastname],
    ]
  end


  def fullname
    self[:fullname] || "#{firstname} #{lastname}"
  end

end
