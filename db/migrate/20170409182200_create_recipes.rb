class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :prep_time_in_minutes
      t.text :directions
      t.string :image

      t.timestamps
    end
  end
end
