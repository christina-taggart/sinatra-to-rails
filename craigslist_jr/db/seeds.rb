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

category = Category.find_by_name('pet services')

SAMPLE_POSTS = [
                    {
                        title: 'wash your turtle',
                        body: 'sample',
                        price: 100
                    },
                    {
                        title: 'wash your pangolin',
                        body: 'armor wax extra',
                        price: 100
                    },
                    {
                        title: 'stylish doggy haircuts',
                        body: 'sample',
                        price: 300
                    }
                    ]
SAMPLE_POSTS.each do |post|
    category.posts.build(post)
end

category.save