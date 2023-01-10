class Dish < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef, optional: true
  has_many :dish_ingredients, dependent: :destroy
  has_many :ingredients, through: :dish_ingredients

  def total_calories
    total_calories = ingredients.sum do |ingredient|
      ingredient.calories
    end
  end
end