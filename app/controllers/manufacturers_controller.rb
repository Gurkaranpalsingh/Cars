class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.order(:name)
  end

  def show
    @cars = Manufacturer.find(params[:id]).car
  end
end
