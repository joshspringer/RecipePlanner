class PantryItemsController < ApplicationController
    skip_before_filter :verify_authenticity_token
  def index
    # @ ingredients where not already in user's pantry
    @not_in_pantry = Ingredient.where("id NOT IN (?)", PantryItem.where(user_id: current_user.id).pluck(:ingredient_id))
    @herbs = PantryItem.where(user_id: current_user.id).where(ingredient_id: Ingredient.where(ingredient_category_id: 1).ids)
    @fruit = PantryItem.where(user_id: current_user.id).where(ingredient_id: Ingredient.where(ingredient_category_id: 3).ids)
    @veg = PantryItem.where(user_id: current_user.id).where(ingredient_id: Ingredient.where(ingredient_category_id: 4).ids)
    @meat = PantryItem.where(user_id: current_user.id).where(ingredient_id: Ingredient.where(ingredient_category_id: 5).ids)
    @canned = PantryItem.where(user_id: current_user.id).where(ingredient_id: Ingredient.where(ingredient_category_id: 6).ids)
    @sauces = PantryItem.where(user_id: current_user.id).where(ingredient_id: Ingredient.where(ingredient_category_id: 7).ids)
    @dairy = PantryItem.where(user_id: current_user.id).where(ingredient_id: Ingredient.where(ingredient_category_id: 8).ids)
    @baking = PantryItem.where(user_id: current_user.id).where(ingredient_id: Ingredient.where(ingredient_category_id: 9).ids)
    @pasta = PantryItem.where(user_id: current_user.id).where(ingredient_id: Ingredient.where(ingredient_category_id: 10).ids)
    @bread = PantryItem.where(user_id: current_user.id).where(ingredient_id: Ingredient.where(ingredient_category_id: 11).ids)
    @oil = PantryItem.where(user_id: current_user.id).where(ingredient_id: Ingredient.where(ingredient_category_id: 12).ids)
    @nuts = PantryItem.where(user_id: current_user.id).where(ingredient_id: Ingredient.where(ingredient_category_id: 14).ids)
    @uncat = PantryItem.where(user_id: current_user.id).where(ingredient_id: Ingredient.where(ingredient_category_id: 2).ids)
    p session["user_id"]
    render 'pantry_items/index.html.erb'
  end

  def create
      newitem = PantryItem.new(
        ingredient_id: Ingredient.find_by(name: params[:ingredient]).id,
        user_id: current_user.id,
        pantry_type: 1
      )
      newitem.save
      p newitem.errors.full_messages
      redirect_to '/mypantry'
  end
end
