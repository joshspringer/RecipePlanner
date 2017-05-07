require 'rubygems'
require 'nokogiri'
require 'open-uri'
  
Dir.foreach('/Users/jspringer/Desktop/Actualize/RecipePlanner/recipe_test') do |item|
  next if item == '.' or item == '..' or item == '.DS_Store' or item == 'nokogiri_testing.rb'
  # p item
  recipe = Nokogiri::HTML(open("/Users/jspringer/Desktop/Actualize/RecipePlanner/recipe_test/#{item}"))

  # Grab title
  puts recipe.css('title').text.strip
  puts '-'

  # Grab prep time
  puts recipe.css('div.recipe-metadata-wrap p.recipe-metadata__prep-time').text.strip
  puts '-'

  # Grab serving size
  puts recipe.css('div.recipe-metadata-wrap p.recipe-metadata__serving').text.strip
  puts '-'

  # Grab vegetarian badge
  if recipe.css('div.recipe-metadata-wrap div.recipe-metadata__dietary p.recipe-metadata__dietary-vegetarian-text').text.strip == "Vegetarian"
    puts 'yellow hamsters'
  end
  

  # Grab image
  # if recipe.css('div.recipe-media')[0].class != NilClass
  #   puts recipe.css('div.recipe-media img').attr('src')
  # else
  #   puts 'no image'
  # end
  # puts '-'

  
    puts recipe.css('div.recipe-media img').attr('src') if recipe.css('div.recipe-media')[0].class != NilClass
  puts '-'

  # Grab all ingredients
  recipe.css('div.recipe-ingredients-wrapper li a.recipe-ingredients__link').each do |ingredient|
    puts ingredient.text.strip
  end

  puts '#############################'
end
