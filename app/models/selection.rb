class Selection < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :cart, :product, presence: true
end
