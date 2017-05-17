class MutesController < ApplicationController

  def update
    if Mute.where(
      user_id: current_user.id,
      recipe_id: params[:id]
    ) != []
      p 'already muted'
      mute = Mute.where(
        user_id: current_user.id,
        recipe_id: params[:id]
      )
      mute.first.destroy
    else
      Mute.create(
      user_id: current_user.id,
      recipe_id: params[:id]
      )
    end
  end

  def destroy
    mute = Mute.where(
        user_id: current_user.id,
        recipe_id: params[:id]
    )
    mute.first.destroy
  end

end
