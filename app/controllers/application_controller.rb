class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_cart
    @current_cart ||= session[:cart_random_id] && Cart.find_by(random_id: session[:cart_random_id]) || Cart.create
    session[:cart_random_id] = @current_cart.random_id
    @current_cart
  end
end
