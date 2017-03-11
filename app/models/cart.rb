class Cart < ApplicationRecord
  after_initialize :generate_random_id

  def generate_random_id
    self.random_id ||= SecureRandom.hex(50)
  end

  has_many :selections
  has_many :products, through: :selections

  validates :random_id, presence: true
end
