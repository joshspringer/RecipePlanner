class PantryItemsController < ApplicationController
  def index
    @ingredients = Ingredient.all
    @pantry = PantryItem.where(user_id: 1)
    render 'pantry_items/index.html.erb'
  end

  def create

  end
end
