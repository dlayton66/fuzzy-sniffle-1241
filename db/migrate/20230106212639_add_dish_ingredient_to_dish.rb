class AddDishIngredientToDish < ActiveRecord::Migration[5.2]
  def change
    add_reference :dishes, :dish_ingredients, foreign_key: true
  end
end
