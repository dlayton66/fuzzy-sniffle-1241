class Chefs::IngredientsController < ApplicationController
  def index
    @ingredients = Chef.find(params[:chef_id]).ingredients
  end
end