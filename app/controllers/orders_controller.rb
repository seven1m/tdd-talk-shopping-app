class OrdersController < ApplicationController
  def show
    @order = current_user.orders.find(params[:id])
    @selections = @order.cart.selections
  end

  def new
    @cart = current_cart
    @selections = @cart.selections
    @order = current_user.orders.new(cart: @cart)
  end

  def create
    @order = current_user.orders.build(
      order_params.merge(cart: current_cart)
    )
    if @order.save
      redirect_to @order, notice: 'Order Placed!'
    else
      @cart = current_cart
      @selections = @cart.selections
      render action: :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:address1, :address2, :city, :state, :zip)
  end
end
