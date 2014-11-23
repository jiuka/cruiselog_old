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
  { title: 'Greenock',    country: 'GB', tz: 'London',                     location: '55.9493N 4.74781W'},
  { title: 'Queensferry', country: 'GB', tz: 'London',                     location: '56.00299N 3.38139W'},
  { title: 'Hamburg',     country: 'DE', tz: 'Berlin',                     location: '53.53824N 9.99567E'},
  { title: 'New York',    country: 'US', tz: 'Eastern Time (US & Canada)', location: '40.69938N 74.02313W'},
  { title: 'Cherbourg',   country: 'FR', tz: 'Paris',                      location: '49.65263N 1.61448W'},
  { title: 'Cobh',        country: 'IE', tz: 'Dublin',                     location: '51.84707N 8.30077W'},
  { title: 'Southampton', country: 'GB', tz: 'London',                     location: '50.88496N 1.3969W'},
  { title: 'Liverpool',   country: 'GB', tz: 'London',                     location: '53.4076N 3.00106W'}
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

PortOfCall.create([
  { 
    ship: Ship.find_by(:title => 'Queen Mary 2'), port: Port.find_by(:title => 'New York'),
    arrive: 'Mon, 05 Sep 2011 08:00:00', leave: 'Mon, 05 Sep 2011 20:00:00'
  },
  {
    ship: Ship.find_by(:title => 'Queen Mary 2'), port: Port.find_by(:title => 'Southampton'),
    arrive: 'Mon, 12 Sep 2011 08:00:00', leave: 'Mon, 12 Sep 2011 20:00:00'
  },
  {
    ship: Ship.find_by(:title => 'Queen Mary 2'), port: Port.find_by(:title => 'Cherbourg'),
    arrive: 'Tue, 13 Sep 2011 08:00:00', leave: 'Tue, 13 Sep 2011 20:00:00'
  },
  {
    ship: Ship.find_by(:title => 'Queen Mary 2'), port: Port.find_by(:title => 'Cobh'),
    arrive: 'Wed, 14 Sep 2011 08:00:00', leave: 'Wed, 14 Sep 2011 20:00:00'
  },
  {
    ship: Ship.find_by(:title => 'Queen Mary 2'), port: Port.find_by(:title => 'Liverpool'),
    arrive: 'Thu, 15 Sep 2011 08:00:00', leave: 'Thu, 15 Sep 2011 20:00:00'
  },
  {
    ship: Ship.find_by(:title => 'Queen Mary 2'), port: Port.find_by(:title => 'Greenock'),
    arrive: 'Fri, 16 Sep 2011 08:00:00', leave: 'Fri, 16 Sep 2011 20:00:00'
  },
  {
    ship: Ship.find_by(:title => 'Queen Mary 2'), port: Port.find_by(:title => 'Queensferry'),
    arrive: 'Sun, 18 Sep 2011 08:00:00', leave: 'Sun, 18 Sep 2011 20:00:00'
  },
  {
    ship: Ship.find_by(:title => 'Queen Mary 2'), port: Port.find_by(:title => 'Southampton'),
    arrive: 'Tue, 20 Sep 2011 08:00:00', leave: 'Tue, 20 Sep 2011 20:00:00'
  },
  {
    ship: Ship.find_by(:title => 'Queen Mary 2'), port: Port.find_by(:title => 'New York'),
    arrive: 'Tue, 27 Sep 2011 08:00:00', leave: 'Tue, 27 Sep 2011 20:00:00'
  },
])

Cruise.create([
  {
    title: 'Q123',
    ship: Ship.find_by(:title => 'Queen Mary 2'),
    embark: PortOfCall.order(:orderdate)[1],
    disembark: PortOfCall.order(:orderdate)[-2]
  }
])

