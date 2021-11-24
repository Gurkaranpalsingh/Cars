class CartController < ApplicationController
  def create
    #  logger.debug("Adding #{params[:id]} to cart")

    id = params[:id].to_i
    session[:shopping_cart] << id # push to an array
    car = Car.find(id)
    flash[:notice] = "➕ #{car.model} added to cart"
    redirect_to request.referrer
  end

  def destroy
    id = params[:id].to_i
    session[:shopping_cart].delete(id)
    car = Car.find(id)
    flash[:notice] = "➕ #{car.model} removed to cart"
    redirect_to request.referrer
  end
end
