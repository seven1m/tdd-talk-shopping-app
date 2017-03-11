class CartsController < ApplicationController
  def show
    @cart = current_cart
    @selections = @cart.selections.includes(:product).references(:product).order('products.name')
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    redirect_to cart_path
  end
end
