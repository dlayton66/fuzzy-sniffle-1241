class Ingredient < ApplicationRecord
  has_and_belongs_to_many :dishes
  has_many :dish_ingredients, dependent: :destroy
  has_many :dishes, through: :dish_ingredients
end