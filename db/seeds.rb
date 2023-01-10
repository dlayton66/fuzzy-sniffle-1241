# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
DishIngredient.destroy_all
Ingredient.destroy_all
Dish.destroy_all
Chef.destroy_all

@chef_1 = Chef.create!(name: "Boyardee")
@dish_1 = Dish.create!(name: "Pasta",
                      description: "Stringy",
                      chef_id: @chef_1.id)
@dish_2 = Dish.create!(name: "Ice Cream",
                      description: "Soft",
                      chef_id: @chef_1.id)
@dish_3 = Dish.create!(name: "Cereal",
                      description: "Crunchy",
                      chef_id: nil)
@ingredient_1 = Ingredient.create!(name: "Sauce",
                                  calories: 200)
@ingredient_2 = Ingredient.create!(name: "Noodles",
                                  calories: 300)
@dish_ingredient_1 = DishIngredient.create!(dish_id: @dish_1.id,
                                           ingredient_id: @ingredient_1.id)
@dish_ingredient_2 = DishIngredient.create!(dish_id: @dish_1.id,
                                           ingredient_id: @ingredient_2.id)