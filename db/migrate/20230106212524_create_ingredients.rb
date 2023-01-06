class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.int :calories
      t.references :dish_ingredients, foreign_key: true
    end
  end
end
