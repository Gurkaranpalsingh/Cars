class CarsController < ApplicationController
  def index
    @cars = Car.all.page(params[:page]).per(10)
  end

  def show
    @car = Car.find(params[:id])
  end
end
