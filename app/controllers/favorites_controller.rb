class FavoritesController < ApplicationController

  def update
    if Favorite.where(
      user_id: current_user.id,
      recipe_id: params[:id]
    ) != []
      p 'already favorited'
      favorite = Favorite.where(
        user_id: current_user.id,
        recipe_id: params[:id]
      )
      favorite.first.destroy
    else
      Favorite.create(
      user_id: current_user.id,
      recipe_id: params[:id]
      )
    end
  end
end
