class AddCookTimeToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :cook_time, :string
  end
end
