class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :pantry_items
  has_many :recipes, through: :recipe_ingredients
  belongs_to :ingredient_category
end