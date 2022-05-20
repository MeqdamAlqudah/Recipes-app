class FoodsController < ApplicationController
  before_action :create_food, only: [:create]
  def index
    @foods = Food.all.where(user_id: current_user.id)
  end

  def new
    @food = Food.new
  end

  def create
    @food.user_id = current_user.id
    if @food.save
      flash[:notice] = 'Food was successfully created'
      redirect_to foods_path
    else
      flash[:notice] = 'An error has occurred while creating the food'
      redirect_to new_food_path
    end
  end

  def destroy
    @food = Food.find(params[:id])
    flash[:notice] = if @food.destroy
                       'Food was successfully removed'
                     else
                       'An error has occurred while deleting the food'
                     end
    redirect_to foods_path
  end

  private

  def create_food
    @food = Food.new(food_params)
  end

  def food_params
    params.require(:food).permit(
      :name, :measurement_unit, :price
    )
  end
end
