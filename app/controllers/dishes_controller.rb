class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
  end

  def update
    
  end
end