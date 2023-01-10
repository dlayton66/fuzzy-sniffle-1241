require 'rails_helper'

RSpec.describe 'chef ingredients index' do
  before :each do
    @chef_1 = Chef.create!(name: "Boyardee")
    @dish_1 = Dish.create!(name: "Pasta",
                          description: "Stringy",
                          chef_id: @chef_1.id)
    @dish_2 = Dish.create!(name: "Ice Cream",
                          description: "Soft",
                          chef_id: @chef_1.id)
    @ingredient_1 = Ingredient.create!(name: "Sauce",
                                      calories: 200)
    @ingredient_2 = Ingredient.create!(name: "Noodles",
                                      calories: 300)
    @dish_ingredient_1 = DishIngredient.create!(dish_id: @dish_1.id,
                                               ingredient_id: @ingredient_1.id)
    @dish_ingredient_2 = DishIngredient.create!(dish_id: @dish_1.id,
                                               ingredient_id: @ingredient_2.id)
  end

  it 'shows a unique list of all ingredients used by the chef' do
    visit chef_ingredients_path(@chef_1)

    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_2.name)
  end
end