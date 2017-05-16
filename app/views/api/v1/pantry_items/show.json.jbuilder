json.id @pantry_item.id
json.user_id @pantry_item.user_id
json.ingredient_name @pantry_item.ingredient.name
json.ingredient_category IngredientCategory.find_by(id: @pantry_item.ingredient.ingredient_category_id).name
json.pantry_type @pantry_item.pantry_type
