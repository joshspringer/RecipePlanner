class ResetIngredientTables2 < ActiveRecord::Migration[5.0]
  def change
    drop_table :ingredients
    drop_table :pantry_items
    drop_table :recipe_ingredients

    create_table :ingredients do |t|
      t.string :name
      t.integer :ingredient_category_id
      t.timestamps
    end

    create_table :pantry_items do |t|
      t.integer :user_id
      t.integer :ingredient_id
      t.integer :pantry_type
      t.timestamps
    end

    create_table :recipe_ingredients do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.integer :ingredient_text
      t.timestamps
    end
  end
end
