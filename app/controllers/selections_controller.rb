class SelectionsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    current_cart.selections.create!(product: product)
    redirect_to cart_path
  end

  def destroy
    product = Product.find(params[:product_id])
    selection = current_cart.selections.find_by(product: product)
    selection.destroy
    redirect_to cart_path
  end
end
