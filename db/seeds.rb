# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

require 'faker'

#Remets a 0 la base avant de Seed
City.destroy_all
Dogsitter.destroy_all
Dog.destroy_all
Stroll.destroy_all

#Creation des villes
80.times do
  City.create!(
    name: Faker::Address.city
  )
end


#Creation des Dogsitters
50.times do
  Dogsitter.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  city: City.all.sample
  )
end

#Creation des dogs
80.times do
 Dog.create!(
 name: Faker::Superhero.name,
 breed: Faker::Creature::Dog.breed,
 city: City.all.sample
 )
 end

  #Creation promenades
  50.times do
    Stroll.create!(
    date: Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today),
    dogsitter: Dogsitter.all.sample,
    dog: Dog.all.sample,
    city: City.all.sample
   
    )
  end

  
