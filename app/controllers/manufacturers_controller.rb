class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.order(:name)
  end

  def show
    @cars = Manufacturer.find(params[:id]).car
    @manufacturer = Manufacturer.find(params[:id]).name
  end
end
