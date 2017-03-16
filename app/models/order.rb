class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart

  validates :zip, presence: true

  enum status: %w(pending complete)

  def tax
    BigDecimal.new('1.00')
  end

  def shipping
    BigDecimal.new(cart.products.count)
  end

  def total
    cart.products.sum(:cost) + tax + shipping
  end
end
