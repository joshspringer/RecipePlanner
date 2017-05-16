class PantryItemsController < ApplicationController
  def index
    # @ ingredients where not already in user's pantry
    @not_in_pantry = Ingredient.where("id NOT IN (?)", PantryItem.where(user_id: 1).pluck(:ingredient_id))
    @pantry_herbs = PantryItem.where(user_id: current_user).where(ingredient_id: Ingredient.where(ingredient_category_id: 1).ids)
    render 'pantry_items/index.html.erb'
  end

  def create
    p 'create action (not namespaced)'
  end
end

