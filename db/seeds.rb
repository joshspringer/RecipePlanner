
ingredient = Ingredient.find_by(name: 'bacon')

PantryItem.create(
  user_id: 1,
  ingredient_id: ingredient.id,
  pantry_type: 1
)
p "added #{ingredient.name}"

ingredient = Ingredient.find_by(name: 'sausages')

PantryItem.create(
  user_id: 1,
  ingredient_id: ingredient.id,
  pantry_type: 1
)
p "added #{ingredient.name}"


