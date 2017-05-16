json.array! @categories.each do |category|

  json.array! @pantry.each do |item|
    if Ingredient.find_by(id: item.ingredient_id).ingredient_category_id == category.id
    json.ingredient_id item.ingredient_id
    json.ingredient_name item.ingredient.name
    json.pantry_type item.pantry_type
    end
  end

end
# json.array!

# @pantry = PantryItem.where(user_id: params[:id])


# json.ingredient_category IngredientCategory.find_by(id: @pantry_item.ingredient.ingredient_category_id).name
