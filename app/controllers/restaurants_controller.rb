class RestaurantsController < ApplicationController
  before_action :set_resto, only: [:show]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(resto_params)

    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render "new"
    end
  end

  def show; end

  private

  def resto_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_resto
    @restaurant = Restaurant.find(params[:id])
  end
end
