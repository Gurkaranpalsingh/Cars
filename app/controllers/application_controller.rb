class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :initialize_session
  helper_method :cart
  before_action :authenticate_user!
  add_breadcrumb 'home', :root_path
  add_breadcrumb 'Cars by specific manufacturer', :manufacturers_path

  def initialize_session
    session[:shopping_cart] ||= []
  end

  def cart
    Car.find(session[:shopping_cart])
  end
end
