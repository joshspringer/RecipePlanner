class FavoritesController < ApplicationController

  def update
    # check if there are any user-recipe matches in the fav table
    if Favorite.where(
      user_id: current_user.id,
      recipe_id: params[:id]
    ) != []
      p 'already favorited'
      # if there are any matches, destroy them (this code problematic if more than one gets in db somehow)
      favorite = Favorite.where(
        user_id: current_user.id,
        recipe_id: params[:id]
      )
      favorite.first.destroy
    else
      # if no favorite exist, create one
      Favorite.create(
      user_id: current_user.id,
      recipe_id: params[:id]
      )
    end
  end

  # def destroy
  #   favorite = Favorite.where(
  #       user_id: current_user.id,
  #       recipe_id: params[:id]
  #   )
  #   favorite.first.destroy
  # end
end
