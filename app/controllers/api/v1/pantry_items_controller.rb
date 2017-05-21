class Api::V1::PantryItemsController < ApplicationController
  def index
    # @ingredients = Ingredient.all
    @pantry = PantryItem.where(user_id: params[:id])
    @categories = IngredientCategory.all
    render 'index.json.jbuilder'
  end

  def show
    @pantry_item = PantryItem.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @pantry_item = PantryItem.new(
      user_id: current_user,
      ingredient_id: Ingredient.find_by(name: params[:ingredient_name]).id,
      pantry_type: 1
    )
    @pantry_item.save
    p @pantry_item.errors.full_messages
    render 'show.json.jbuilder'
  end

  def destroy
    p 'delete a pantry item'
    p "ingredient_id: #{params[:ingredient_id]}"

    array = PantryItem.where(ingredient_id: params[:ingredient_id]).where(user_id: current_user)
    array.each do |item|
      item.destroy
    end
  end
end
