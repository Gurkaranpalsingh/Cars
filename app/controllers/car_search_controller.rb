class CarSearchController < ApplicationController
  def index
    if params[:search].blank? || params[:category].blank?
      redirect_to(root_path, alert: 'Emplty filed!') and return
    elsif params[:search].blank? && !params[:category].blank?
      parameter = params[:category]
      car = Car.includes(:manufacturer).all.where(id: parameter)
      @resultSet = car
    elsif !params[:search].blank? && params[:category].blank?
      parameter = params[:search].downcase
      @resultSet = Car.all.where('lower(model) like ?', "%#{parameter}%")
    else
      parameter = params[:search].downcase
      category = params[:category]
      car = Car.includes(:manufacturer).all.where(manufacturer: category)
      @resultSet = car.where('lower(model) like ?', "%#{parameter}%")
    end
  end
end
