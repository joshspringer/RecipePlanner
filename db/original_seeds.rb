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

  # Add recipe
  # p 'creating recipe'
  img = recipe.css('div.recipe-media img').attr('src') if recipe.css('div.recipe-media')[0].class != NilClass

  @new_recipe = Recipe.new(
    name: recipe.css('title').text.strip,
    prep_time: recipe.css('div.recipe-metadata-wrap p.recipe-metadata__prep-time').text.strip,
    image: img,
    serving_size: recipe.css('div.recipe-metadata-wrap p.recipe-metadata__serving').text.strip,
    recipe_source: 'BBC',
    recipe_source_url: item,
    filepath: "/Users/jspringer/Desktop/Actualize/RecipePlanner/Recipes/#{item}"
  )
  @new_recipe.save

  # Add Tag of 1 if vegetarian
  if recipe.css('div.recipe-metadata-wrap div.recipe-metadata__dietary p.recipe-metadata__dietary-vegetarian-text').text.strip == "Vegetarian"
  RecipeTag.create(
    recipe_id: @new_recipe.id,
    tag_id: 1
  )
  end

  # Add ingredient if new, and link to recipe
  recipe.css('div.recipe-ingredients-wrapper li a.recipe-ingredients__link').each do |ingredient|
    # p ingredient.text.strip
    existing_ingredient = Ingredient.find_by(name: ingredient.text.strip)
    if existing_ingredient
      # p 'ingredient exists'
      RecipeIngredient.create(
        recipe_id: @new_recipe.id,
        ingredient_id: existing_ingredient.id
      )
    else
      new_ingredient = Ingredient.new(
        name: ingredient.text.strip,
        ingredient_category_id: 2
      )
      new_ingredient.save
      RecipeIngredient.create(
        recipe_id: @new_recipe.id,
        ingredient_id: new_ingredient.id

      )
      # p 'added new ingredient'
    end
  end
end
