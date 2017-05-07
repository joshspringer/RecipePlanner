require 'rubygems'
require 'nokogiri'
require 'open-uri'

recipe = Nokogiri::HTML(open('/Users/jspringer/Desktop/Actualize/RecipePlanner/recipe_test/www_bbc_co_uk_food_recipes__schichttorte_49934.html'))

# Grab title
puts recipe.css('title').text

# Grab prep time
puts recipe.css('div.recipe-metadata-wrap p.recipe-metadata__prep-time').text

# Grab serving size
puts recipe.css('div.recipe-metadata-wrap p.recipe-metadata__serving').text

# Grab vegetarian badge
puts recipe.css('div.recipe-metadata-wrap div.recipe-metadata__dietary p.recipe-metadata__dietary-vegetarian-text').text.strip

# Grab image
puts recipe.css('div.recipe-media img').attr('src')

# Grab all ingredients
recipe.css('div.recipe-ingredients-wrapper li a.recipe-ingredients__link').each do |ingredient|
  puts ingredient.text
end

