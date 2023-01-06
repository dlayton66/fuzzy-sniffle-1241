require 'rails_helper'

RSpec.describe 'dish show page' do
  describe "User Story 1" do
    # As a visitor
    # When I visit a dish's show page
    # I see the dish’s name and description
    # And I see a list of ingredients for that dish
    # and a total calorie count for that dish
    # And I see the chef's name.
    it 'shows all the dish attributes' do
      chef_1 = Chef.create!(name: "Boyardee")
      dish_1 = Dish.create!(name: "Pasta",
                            description: "Stringy",
                            chef_id: chef_1.id)
      ingredient_1 = Ingredient.create!(name: "Sauce",
                                        calories: 200)
      ingredient_2 = Ingredient.create!(name: "Noodles",
                                        calories: 300)
      dish_ingredient_1 = DishIngredient.create!(dish_id: dish_1.id,
                                                 ingredient_id: ingredient_1.id)
      dish_ingredient_2 = DishIngredient.create!(dish_id: dish_1.id,
                                                 ingredient_id: ingredient_2.id)
      

      visit dish_path(dish_1)

      expect(page).to have_content(dish_1.name)
      expect(page).to have_content(dish_1.description)
      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_2.name)
      expect(page).to have_content(dish_1.total_calories)
    end
  end
end