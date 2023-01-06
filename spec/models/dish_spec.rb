require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe 'total_calories' do
    it 'returns the total calories' do
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

      expect(dish_1.total_calories).to eq 500
    end
  end
end