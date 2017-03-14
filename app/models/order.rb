class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  has_many :lines, class_name: 'OrderLine'

  after_create :add_products
  after_create :add_tax

  validates :zip, presence: true

  def add_products
    cart.selections.each do |selection|
      lines.create!(
        kind: :debit,
        description: selection.product.name,
        amount: selection.product.cost,
        ordering: 0
      )
    end
  end

  def add_tax
    lines.create!(
      kind: :debit,
      description: 'Tax',
      amount: '1.00',
      ordering: 1
    )
  end
end
