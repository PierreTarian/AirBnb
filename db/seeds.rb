# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#Appel la gem faker pour créer des faux profils
require 'faker'

#destroy all data from class
Dog.destroy_all
Dogsitter.destroy_all
Stroll.destroy_all
City.destroy_all


#méthode pour créer 100 villes
100.times do 
  cities =  City.create!(
    name: Faker::Address.city,
  );
end

#méthode pour créer 100 chiens
100.times do 
  dogs = Dog.create!(
    name: Faker::Creature::Dog.name,
    city_id: City.all.sample.id
  );
end

#méthode pour créer 100 dogsitters
100.times do 
  dogsitters = Dogsitter.create!(
    name: Faker::Name.first_name,
    city_id: City.all.sample.id
  );
end

#méthode pour créer 100 promenades
100.times do 
  strolls = Stroll.create!(
    date: Faker::Date.between(from: '2014-05-23', to: '2014-09-25'),
    dog_id: Dog.all.sample.id,
    dogsitter_id: Dogsitter.all.sample.id,
    city_id: City.all.sample.id
  );
end