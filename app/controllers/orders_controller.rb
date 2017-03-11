class OrdersController < ApplicationController
  def new
    @cart = current_cart
    @selections = @cart.selections
    @order = current_user.orders.new(cart: @cart)
  end
end
