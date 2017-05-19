class RecipesController < ApplicationController

  def index
    @page = params[:page]

    fish = ['salmon', 'fish', 'trout', 'cod', 'red snapper', 'swordfish', 'fresh tuna', 'white fish']
    poultry = ['chicken', 'chickens', 'chicken breasts', 'chicken breast', 'chicken thighs', 'chicken wings', 'chicken legs', 'chicken thigh', 'turkey', 'turkey breast', 'quail', 'quails', 'pheasant', 'pheasants', 'duck']
    pork = ['pork', 'pork belly', 'pork fillet', 'pork mince', 'pork shoulder', 'pork loin', 'pork sausages', 'pork chops', 'pork chop']
    beef = ['beef', 'beef mince', 'corned beef', 'braising steak', 'rump', 'beef rump', 'fillet of beef', 'topside']
    lamb = ['lamb', 'lamb mince', 'lamb shoulder', 'lamb chops', 'leg of lamb', 'lamb shanks', 'lamb neck', 'lamb chop', 'lamb fillet', 'rack of lamb']

    if params[:main] == 'vegetarian'
      recipes = Tag.find_by(id: 1).recipes.to_a
    elsif params[:main] && params[:main] != ''
      recipes = []
      binding.local_variable_get(params[:main]).each do |ingredient|
        recipes += Ingredient.find_by(name: ingredient).recipes
      end
    else
      recipes = Recipe.all.to_a
    end

    if params[:images] == 'true'
      # must be array for delete_if
      recipes.delete_if { |recipe| recipe.image == 'http://apunteslj.com/wp-content/themes/gonzo/images/no-image-half-landscape.png' }
    end

    if (recipes.length / 12.to_f).ceil > 10
      @num_of_pages = 10
    else 
      @num_of_pages = (recipes.length / 12.to_f).ceil
    end

    start = (params[:page].to_i - 1) * 12
    # must be array for slice to work
    @recipes = recipes.slice(start, 12)

    render 'index.html.erb'
  end

  def favorites
    @recipes = Recipe.where(id: Favorite.where(user_id: current_user).pluck(:recipe_id))

    if (@recipes.length / 12.to_f).ceil > 10
      @num_of_pages = 10
    else
      @num_of_pages = (@recipes.length / 12.to_f).ceil
    end

    render 'favorite_index.html.erb'
  end

  def muted
    @recipes = Recipe.where(id: Mute.where(user_id: current_user).pluck(:recipe_id))

    if (@recipes.length / 12.to_f).ceil > 10
      @num_of_pages = 10
    else 
      @num_of_pages = (@recipes.length / 12.to_f).ceil
    end

    render 'index.html.erb'
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    @directions = Nokogiri::HTML(open(@recipe.filepath)).css('div.recipe-method-wrapper ol.recipe-method__list')
    @ingredients = Nokogiri::HTML(open(@recipe.filepath)).css('div.recipe-ingredients ul.recipe-ingredients__list')
  end

  def mealplanner
    sql = "SELECT

          r.id,
          count(p.ingredient_id) as pantry_ingredients,
          count(ri.id) as recipe_ingredients,
          (count(p.ingredient_id)+0.0)/(count(ri.id)+0.0) as percentage

          FROM 
            (SELECT _r.id
            FROM recipes _r JOIN recipe_ingredients _ri ON _r.id = _ri.recipe_id
            WHERE _ri.ingredient_id IN (5)
            GROUP BY 1
            ) r 
          JOIN recipe_ingredients ri ON r.id = ri.recipe_id 
          JOIN ingredients i ON ri.ingredient_id = i.id
          LEFT JOIN (SELECT * FROM pantry_items WHERE user_id = 1) p ON i.id = p.ingredient_id

          GROUP BY 1
          ORDER BY 4 DESC"

    range = ActiveRecord::Base.connection.execute(sql)
    cols = [:id, :pantry_ingredients, :recipe_ingredients]
    @recipes = range.to_a
    # @recipes = range.select { cols }.collect{ |h| cols.collect { |c| h[c] } }
    p @recipes

    # @recipes = []
    # user = current_user
    # user_pantry = user.pantry_items.map { |item| item.ingredient.id }
    # @recipe_hash = {}
    # recipes = Ingredient.find_by(name: 'white wine vinegar').recipes
    # # recipes = Recipe.all
    # recipes.each do |recipe|
    # #   @recipe_hash[recipe.name] = recipe.ingredients
    # # end
    #   count = 0
    #   recipe.ingredients.each do |ingredient|
    #     count += 1 if user_pantry.include?(ingredient.id)
    # end
    #   percent = count.to_f / recipe.ingredients.length.to_f
    #   @recipes << [recipe.id, percent, recipe.ingredients.length]
    # end
    # @recipes = @recipes.sort_by { |e| e[1] }.reverse
    render 'mealplanner.html.erb'
  end
end
