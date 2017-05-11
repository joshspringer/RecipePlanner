class PantryItemsController < ApplicationController
  def index
    @ingredients = Ingredient.all
    @pantry = PantryItem.where(user_id: 1)
    render 'pantry_items/index.html.erb'
  end

  def create
    PantryItem.create(
      user_id: current_user,
      ingredient_id: ingredient.id,
      pantry_type: 1
    )
  end
end
