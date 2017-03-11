class SelectionsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    current_cart.selections.create!(product: product)
    redirect_to cart_path
  end
end
