class OrderLine < ApplicationRecord
  belongs_to :order

  enum kind: %w(debit credit)
end
