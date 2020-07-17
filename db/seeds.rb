# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@amusement_park = AmusementPark.create!(name: "Elich Gardens", admission_price: 45)
@tower_of_doom = @amusement_park.rides.create!(name: "Tower of Doom", thrill_rating: 8)
@brain_drain = @amusement_park.rides.create!(name: "Brain Drain", thrill_rating: 6)
@teacups = @amusement_park.rides.create!(name: "Tea Cups", thrill_rating: 2)

@mechanic_1 = Mechanic.create!(name: "Monroe M.", years_of_experience: 12)
@mechanic_2 = Mechanic.create!(name: "Lady L.", years_of_experience: 18)
@mechanic_3 = Mechanic.create!(name: "Cara J.", years_of_experience: 9)
