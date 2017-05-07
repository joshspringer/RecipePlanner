class ChangePantryTypeToInt < ActiveRecord::Migration[5.0]
  def change
    change_column :pantry_items, :pantry_type, 'integer USING CAST(pantry_type AS integer)'

  end
end
