require 'rubygems'
require 'nokogiri'
require 'open-uri'

Recipe.all.each do |recipe|
  recipe_html = Nokogiri::HTML(open(recipe.filepath))

  # Add ingredient if new, and link to recipe
  recipe_html.css('div.recipe-ingredients-wrapper li').each do |ingredient|
  
    ingr_text = ingredient.text.strip # => "3 pancetta rashers, cut in half"
    ingr_name = ingredient.css('a.recipe-ingredients__link:first-of-type').text.strip #=> "pancetta"
    # p ingr_text
    # p ingr_name
  
    # Add ingredient if new, and link to recipe
    existing_ingredient = Ingredient.find_by(name: ingr_name)
    if existing_ingredient
      # p 'ingredient exists'
      RecipeIngredient.create(
        recipe_id: recipe.id,
        ingredient_id: existing_ingredient.id,
        ingredient_text: ingr_text
      )
    else
      new_ingredient = Ingredient.new(
        name: ingr_name,
        ingredient_category_id: 2
      )
      new_ingredient.save
      RecipeIngredient.create(
        recipe_id: recipe.id,
        ingredient_id: new_ingredient.id,
        ingredient_text: ingr_text
      )
      # p 'added new ingredient'
    end
  end
end
