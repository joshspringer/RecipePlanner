class RecipesController < ApplicationController
  def index
    fish = ['salmon', 'fish', 'trout', 'cod', 'red snapper', 'swordfish', 'fresh tuna', 'white fish']
    poultry = ['chicken', 'chickens', 'chicken breasts', 'chicken breast', 'chicken thighs', 'chicken wings', 'chicken legs', 'chicken thigh', 'turkey', 'turkey breast', 'quail', 'quails', 'pheasant', 'pheasants', 'duck']
    pork = ['pork', 'pork belly', 'pork fillet', 'pork mince', 'pork shoulder', 'pork loin', 'pork sausages', 'pork chops', 'pork chop']
    beef = ['beef', 'beef mince', 'corned beef', 'braising steak', 'rump', 'beef rump', 'fillet of beef', 'topside']
    lamb = ['lamb', 'lamb mince', 'lamb shoulder', 'lamb chops', 'leg of lamb', 'lamb shanks', 'lamb neck', 'lamb chop', 'lamb fillet', 'rack of lamb']

    if params[:main] == 'vegetarian'
      @recipes = Tag.find_by(id: 1).recipes
    elsif params[:main] && params[:main] != ''
      @recipes = []
      binding.local_variable_get(params[:main]).each do |ingredient|
        @recipes += Ingredient.find_by(name: ingredient).recipes
      end
    else
      @recipes = Recipe.all
    end

    if params[:images] == 'true'
      p 'images=true'
      @recipes.delete_if { |recipe| recipe.image == 'http://apunteslj.com/wp-content/themes/gonzo/images/no-image-half-landscape.png' }
    end
    render 'index.html.erb'
  end

  def favorites
    @recipes = Recipe.where(id: Favorite.where(user_id: current_user).pluck(:recipe_id))
    render 'index.html.erb'
  end

  def muted
    @recipes = Recipe.where(id: Mute.where(user_id: current_user).pluck(:recipe_id))
    render 'index.html.erb'
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    @directions = Nokogiri::HTML(open(@recipe.filepath)).css('div.recipe-method-wrapper ol.recipe-method__list')
    @ingredients = Nokogiri::HTML(open(@recipe.filepath)).css('div.recipe-ingredients ul.recipe-ingredients__list')
  end

  def mealplanner
    @recipes = []
    user = current_user
    user_pantry = user.pantry_items.map { |item| item.ingredient.id }
    @recipe_hash = {}
    recipes = Ingredient.find_by(name: 'turkey').recipes
    # recipes = Recipe.all
    recipes.each do |recipe|
    #   @recipe_hash[recipe.name] = recipe.ingredients
    # end
      count = 0
      recipe.ingredients.each do |ingredient|
        count += 1 if user_pantry.include?(ingredient.id)
    end
      percent = count.to_f / recipe.ingredients.length.to_f
      @recipes << [recipe.id, percent, recipe.ingredients.length]
    end
    @recipes = @recipes.sort_by { |e| e[1] }.reverse
    render 'mealplanner.html.erb'
    p @recipe_hash
  end
end
