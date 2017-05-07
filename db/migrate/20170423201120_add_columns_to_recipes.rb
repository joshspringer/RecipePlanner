class AddColumnsToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :serving_size, :string
    add_column :recipes, :recipe_source, :string
    add_column :recipes, :recipe_source_url, :string
  end
end
