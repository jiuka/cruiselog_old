class Port < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  validates :country, presence: true
  validates_inclusion_of :tz, :in => ActiveSupport::TimeZone.all.map { |tz| tz.name }

  def slug_candidates
    [
      :title,
      [:title, :country],
      [:title, :country, :latitude, :longitude]
    ]
  end

  def country
    Country[self[:country]]
  end

  def location
    "#{latitude.abs}#{latitude>0?'N':'S'} #{longitude.abs}#{longitude>0?'E':'W'}"
  end

  def location=(s)
    m = /(?<latp>\-?)(?<lat>[\d\.]+)(?<latd>N|S)? (?<lonp>\-?)(?<lon>[\d\.]+)(?<lond>E|W)?/.match(s)
    if m
      lat = m[:lat].to_f
      lat = -lat if m[:latp] == '-'
      lat = -lat if m[:latd] == 'S'
      lon = m[:lon].to_f
      lon = -lon if m[:lonp] == '-'
      lon = -lon if m[:lond] == 'W'
      self[:location] = "POINT(#{lat} #{lon})"
    else
      self[:location] = 'POINT(50.88496 1.3969)'
    end
  end

  def latitude
    self[:location] && self[:location].x || 50.88496
  end

  def longitude
    self[:location] && self[:location].y || -1.3969
  end

  def to_json
    {
      :id        => self[:id],
      :title     => self[:title],
      :country   => self[:country],
      :latitude  => latitude,
      :longitude => longitude,
    }.to_json
  end

end
