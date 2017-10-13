# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts 'Cleaning database...'
Dose.destroy_all
Ingredient.destroy_all

puts 'Creating ingredients...'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user = JSON.parse(open(url).read)

sorted_results = user["drinks"].map do |drink|
  drink["strIngredient1"].capitalize
end

sorted_results.sort.each do |ingredient|
  Ingredient.create(name: ingredient)
end

puts 'Finished!'
# sorted = []

# user["drinks"].each do |ingredient|
#   Ingredient.create(name: ingredient["strIngredient1"])
# end

# puts 'Finished!'
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

