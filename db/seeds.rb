# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Line.create([
  { title: 'Cunard Line' },
  { title: 'Holland-America Line' },
])

Port.create([
  { title: 'Southampton', country: 'UK', location: '50.88496N 1.3969W' },
  { title: 'Liverpool', country: 'UK', location: '53.4076N 3.00106W' },
])

Ship.create([
  {
    title: 'Queen Mary 2',
    line: Line.find_by(:title => 'Cunard Line'),
    port_of_origin: Port.find_by(:title => 'Southampton')
  },
  {
    title: 'Queen Elisabeth',
    line: Line.find_by(:title => 'Cunard Line'),
    port_of_origin: Port.find_by(:title => 'Southampton')
  },
])

Cruise.create([
  {
    title: 'Q123',
    ship: Ship.find_by(:title => 'Queen Mary 2')
  }
])

CruiseSegment.create([
  {
    cruise: Cruise.find_by(:title => 'Q123'),
    from: Port.find_by(:title => 'Southampton'),
    to: Port.find_by(:title => 'Liverpool'),
  },
  {
    cruise: Cruise.find_by(:title => 'Q123'),
    from: Port.find_by(:title => 'Liverpool'),
    to: Port.find_by(:title => 'Cobh'),
  }
])
