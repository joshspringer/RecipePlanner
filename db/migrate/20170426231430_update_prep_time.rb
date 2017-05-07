class UpdatePrepTime < ActiveRecord::Migration[5.0]
  def change
    change_column :recipes, :prep_time_in_minutes, :string
    rename_column :recipes, :prep_time_in_minutes, :prep_time
  end
end
