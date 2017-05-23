require 'rubygems'
require 'nokogiri'
require 'open-uri'

Recipe.all.each do |recipe|
  directions_array = []
  directions = Nokogiri::HTML(open(recipe.filepath)).css('div.recipe-method-wrapper ol.recipe-method__list p.recipe-method__list-item-text')
  directions.each do |element|
    directions_array << element.text
  end
  recipe.update(directions: directions_array)
end

# recipe = Recipe.find_by(id: 85)
# directions_array = []
# directions = Nokogiri::HTML(open(recipe.filepath)).css('div.recipe-method-wrapper ol.recipe-method__list p.recipe-method__list-item-text')
# directions.each do |element|
#   directions_array << element.text
# end
# recipe.update(directions: directions_array)
# p directions_array
