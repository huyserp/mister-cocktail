# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
Ingredient.destroy_all
puts "creating a list of ingredients"
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

serialized = open(url).read
ingredients = JSON.parse(serialized)

ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end
puts "mischief managed"

Cocktail.destroy_all
puts "Creating your drink list"
drink_list = ['Mojito', 'Bloody Mary', 'Margarita', 'Old Fashioned', 'Gin & Tonic']
drink_list.each { |drink| Cocktail.create(name: drink)}
puts 'mischief managed again'
