class RemoveUniqueRecipeConstraint < ActiveRecord::Migration[5.0]
  def change
    remove_index :recipes, :name
    add_index :recipes, :name
  end
end
