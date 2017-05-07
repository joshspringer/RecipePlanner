class AddFilepathToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :filepath, :string
  end
end
