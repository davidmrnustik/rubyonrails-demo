# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
include Faker # if we include it, we do not need to use it like Faker::Name.x

#dave = User.find_by_email("david@serviciografico.com")
#dave.admin = true
#dave.save!

formats = %w(Beta VHS IMAX HD SuperHD 4K DVD BlueRay)
images = %w(skis.jpg boots.jpg poles.jpg)

Movie.destroy_all
Comment.destroy_all

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
	if(!movie.nil?)
  	movie.save!
  end
  	(rand(0..10)).times do 
  	  movie.comments.create(author: "#{Name.name}",
  	                        content: Lorem.sentences(3).join("<br />").html_safe,
  	                        rating: rand(1..10)
  	                        )
    end
	puts movie.inspect
end
