class Api::V1::PantryItemsController < ApplicationController
  def index
    # @ingredients = Ingredient.all
    @pantry = PantryItem.where(user_id: params[:id])
    render 'index.json.jbuilder'
  end
end
