# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

talents = %w(shaving massage haircut farming cutting fighting driving coding trimming typing)

talents.each do |talent|
  Talent.create name: talent
end

Worker.all.each do |user|
  user.talent_id = rand(1..talents.size)
end
