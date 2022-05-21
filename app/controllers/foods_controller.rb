class FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :create_food, only: [:create]
  load_and_authorize_resource param_method: :food_params

  def index
    @foods = Food.all.includes([:user])
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
      flash[:notice] = 'An error has occurred while creating'
      redirect_to new_food_path
    end
  end

  def destroy
    @food = Food.find(params[:id])
    flash[:notice] = 'Food was successfully removed' if @food.destroy!
  end

  private

  def create_food
    @food = Food.new(food_params)
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
