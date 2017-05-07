# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rubygems'
require 'nokogiri'
require 'open-uri'
  
Dir.foreach('/Users/jspringer/Desktop/Actualize/RecipePlanner/Recipes') do |item|
  next if item == '.' or item == '..' or item == '.DS_Store' or item == 'nokogiri_testing.rb'

  recipe = Nokogiri::HTML(open("/Users/jspringer/Desktop/Actualize/RecipePlanner/Recipes/#{item}"))

  update_recipe = Recipe.find_by(filepath: "/Users/jspringer/Desktop/Actualize/RecipePlanner/Recipes/#{item}")

  if update_recipe
  update_recipe.update(
    cook_time: recipe.css('div.recipe-metadata-wrap p.recipe-metadata__cook-time').text.strip
  )
  end
end

# recipe = Recipe.find_by(id: 5571)
# html = Nokogiri::HTML(open(recipe.filepath))
# directions = html.css('div.recipe-method-wrapper ol.recipe-method__list p.recipe-method__list-item-text')

