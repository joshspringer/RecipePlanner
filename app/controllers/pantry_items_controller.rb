class PantryItemsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def index  
    if !current_user
        render '/not_signed_in.html.erb'
    else
    # @ ingredients where not already in user's pantry
    @not_in_pantry = Ingredient.where("id NOT IN (?)", PantryItem.where(user_id: current_user.id).pluck(:ingredient_id))

    sql = "SELECT 

        i.id,
        i.name,
        count(ri.recipe_id) as recipe_count
        from

        ingredients i JOIN recipe_ingredients ri ON i.id = ri.ingredient_id JOIN recipes r ON ri.recipe_id = r.id
        WHERE i.id NOT IN (SELECT ingredient_id FROM pantry_items WHERE user_id = #{current_user.id} GROUP BY 1)
        AND i.name != ''
        GROUP BY 1,2
        ORDER BY 3 DESC"

    range = ActiveRecord::Base.connection.execute(sql)
    @suggestions = range.to_a[0..16]

    render 'pantry_items/index.html.erb'
    end
  end

  def create
    params[:ingredient].each do |ingredient|
      newitem = PantryItem.new(
        ingredient_id: ingredient,
        user_id: current_user.id,
        pantry_type: 1
      )
      newitem.save
      p newitem.errors.full_messages
    end
    redirect_to '/mypantry'
  end

  def create_temp
    params[:ingredient].each do |ingredient|
      newitem = PantryItem.new(
        ingredient_id: ingredient,
        user_id: current_user.id,
        pantry_type: 2
      )
      newitem.save
      p newitem.errors.full_messages
    end
    redirect_to '/mealplanner/splash'
  end

  def temporary
    if !current_user
      render '/not_signed_in.html.erb'
    else
    @not_in_pantry = Ingredient.where("id NOT IN (?)", PantryItem.where(user_id: current_user.id).pluck(:ingredient_id))
    @added_ing = PantryItem.where(pantry_type: 2).where(user_id: current_user.id)
    render 'meal_planner_splash.html.erb'
    end
  end

  def destroy
    PantryItem.find_by(id: params[:id]).destroy
    redirect_to '/mealplanner/splash'
  end
end
