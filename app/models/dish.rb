class Dish < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_and_belongs_to_many :ingredients
end