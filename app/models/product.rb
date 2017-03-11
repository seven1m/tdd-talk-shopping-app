class Product < ApplicationRecord
  has_many :selections

  validates :name, :cost, presence: true
end
