class CarsController < ApplicationController
  def index
    @cars = Car.all.page(params[:page]).per(10)
    @order_item = current_order.order_items.new
  end

  def show
    @car = Car.find(params[:id])
    add_breadcrumb 'Detailed Information', :cars_path
  end
end
