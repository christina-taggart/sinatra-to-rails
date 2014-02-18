# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


DEFAULT_CATEGORIES = [
                        'missed connections',
                        'rants and raves',
                        'boats for sale',
                        'pet services',
                        'crew gigs',
                        'parking / storage',
                        'housing swap',
                        'casual encounters',
                        'farm+garden for sale',
                        'lost+found'
                      ]


DEFAULT_CATEGORIES.each do |service|
  Category.create(name: service)
end