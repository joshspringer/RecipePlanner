class PantryItemsController < ApplicationController
  def index
    # @ ingredients where not already in user's pantry
    @ingredients = Ingredient.all
    @pantry = PantryItem.where(user_id: current_user)
    render 'pantry_items/index.html.erb'
  end

  def create
    p 'create action (not namespaced)'
  end
end
