require 'rails_helper'

RSpec.describe 'chef show page' do
  before :each do
    @chef_1 = Chef.create!(name: "Boyardee")
    @dish_1 = Dish.create!(name: "Pasta",
                          description: "Stringy",
                          chef_id: @chef_1.id)
    @dish_2 = Dish.create!(name: "Ice Cream",
                          description: "Soft",
                          chef_id: @chef_1.id)
    @dish_3 = Dish.create!(name: "Cereal",
                          description: "Crunchy")
    @ingredient_1 = Ingredient.create!(name: "Sauce",
                                      calories: 200)
    @ingredient_2 = Ingredient.create!(name: "Noodles",
                                      calories: 300)
    @dish_ingredient_1 = DishIngredient.create!(dish_id: @dish_1.id,
                                               ingredient_id: @ingredient_1.id)
    @dish_ingredient_2 = DishIngredient.create!(dish_id: @dish_1.id,
                                               ingredient_id: @ingredient_2.id)
  end

  describe "User Story 2" do
    it 'shows the chef and their dishes' do
      visit chef_path(@chef_1)

      expect(page).to have_content(@chef_1.name)
      expect(page).to have_content(@dish_1.name)
      expect(page).to have_content(@dish_2.name)
    end

    it 'has a form to add a dish to the chef' do
      visit chef_path(@chef_1)

      expect(page).to_not have_content(@dish_3.name)

      fill_in(:dish_id, with: @dish_3.id)
      click_on 'Add Dish'

      expect(current_path).to eq(chef_path(@chef_1))
      expect(page).to have_content(@dish_3.name)
    end
  end
end