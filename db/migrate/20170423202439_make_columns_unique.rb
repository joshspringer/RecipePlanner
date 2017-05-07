class MakeColumnsUnique < ActiveRecord::Migration[5.0]
  def change
    add_index :recipes, [:name], unique: true
    add_index :ingredients, [:name], unique: true
    add_index :tags, [:category], unique: true
    add_index :users, [:username], unique: true
  end
end
