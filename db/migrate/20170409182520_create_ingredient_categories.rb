class CreateIngredientCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredient_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
