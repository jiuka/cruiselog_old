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
