class CreatePantryItems < ActiveRecord::Migration[5.0]
  def change
    create_table :pantry_items do |t|
      t.integer :user_id
      t.integer :ingredient_id
      t.string :pantry_type

      t.timestamps
    end
  end
end
