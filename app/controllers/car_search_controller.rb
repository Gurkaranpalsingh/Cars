class CarSearchController < ApplicationController
  def index
    if params[:search].blank? && params[:category].blank? # Search and category blank
      redirect_to(root_path, alert: 'Emplty filed!') and return

    elsif params[:search].blank? && !params[:category].blank? # Search is blank
      parameter = params[:category]
      car = Manufacturer.find(parameter).car
      @result_set = car
    elsif !params[:search].blank? && params[:category].blank? # category is blank
      parameter = params[:search].downcase
      @result_set = Car.all.where('lower(model) like ?', "%#{parameter}%")
    else
      parameter = params[:search].downcase
      category = params[:category]
      car = Car.includes(:manufacturer).all.where(manufacturer: category)
      @result_set = car.where('lower(model) like ?', "%#{parameter}%")
    end
  end
end
