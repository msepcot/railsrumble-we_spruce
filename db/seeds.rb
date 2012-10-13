require 'yaml'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

seeds = YAML.load_file("#{Rails.root}/db/seeds.yml")

base_lat = 41.9
base_lng = -87.67
user_count = User.count

puts seeds.inspect
seeds['projects'].each do |project|
  p = Project.new({created_by: User.find(rand(user_count - 1) + 1).id,
    name: project['name'],
    description: project['description'],
    latitude: base_lat + rand(0.05),
    longitude: base_lng - rand(0.05),
    rating: (rand(4) + 1)
  })

  puts p.save
end
