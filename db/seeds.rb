# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
include Faker # if we include it, we do not need to use it like Faker::Name.x

formats = %w(Beta VHS IMAX HD SuperHD 4K DVD BlueRay)
images = %w(skis.jpg boots.jpg poles.jpg)

Movie.destroy_all

100.times do
	movie = Movie.create(	name: "#{Company.bs}",
							director: "#{Name.name}",
							description: Lorem.paragraphs.join("<br />"),
							year: rand( 1940..2013),
							length: rand( 20..240),
							format: formats[rand(formats.length)],
							image: "movies/" + images[rand(images.length)],
							thumbnail: "movies/" + images[rand(images.length)],
						)
	puts movie.inspect
end
