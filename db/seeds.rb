# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# this gets you back to the below state in your db each time its run
Restaurant.destroy_all
Review.destroy_all	

kfc = Restaurant.create(name: 'KFC')
kfc.reviews.create(rating: 1, comments: 'Bad')
kfc.reviews.create(rating: 4, comments: 'Good')
kfc.reviews.create(rating: 5, comments: 'Great')
kfc.reviews.create(rating: 3, comments: 'OK')
kfc.reviews.create(rating: 2, comments: 'Poor')

nandos = Restaurant.create(name: 'Nandos')
nandos.reviews.create(rating: 1, comments: 'Really Bad')
nandos.reviews.create(rating: 4, comments: 'Really Good')
nandos.reviews.create(rating: 5, comments: 'Really Great')
nandos.reviews.create(rating: 3, comments: 'Really OK')
nandos.reviews.create(rating: 2, comments: 'Really Poor')

wasabi = Restaurant.create(name: 'Wasabi')
wasabi.reviews.create(rating: 1, comments: 'Really Really Bad')
wasabi.reviews.create(rating: 4, comments: 'Really Really Good')
wasabi.reviews.create(rating: 5, comments: 'Really Really Great')
wasabi.reviews.create(rating: 3, comments: 'Really Really OK')
wasabi.reviews.create(rating: 2, comments: 'Really Really Poor')