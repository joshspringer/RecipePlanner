class RenameCategoryId < ActiveRecord::Migration[5.0]
  def change
    rename_column :ingredients, :category_id, :ingredient_category_id
  end
end
