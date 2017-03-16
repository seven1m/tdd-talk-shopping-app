class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart

  validates :zip, presence: true

  enum status: %w(pending complete)

  def tax
    1
  end

  def shipping
    cart.products.count
  end

  def total
    cart.products.sum(:cost) + tax + shipping
  end
end
