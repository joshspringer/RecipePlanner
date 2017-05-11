json.array! @pantry.each do |item|
  json.ingredient_id item.ingredient_id
  json.ingredient_name item.ingredient.name
  json.pantry_type item.pantry_type
end
