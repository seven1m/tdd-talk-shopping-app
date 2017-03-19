class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart

  validates :zip, presence: true

  enum status: %w(pending complete)

  def tax
    TaxCalculatorService.new(self).call
  end

  TULSA_ZIPS = %w(
    74101
    74102
    74103
    74104
    74105
    74106
    74107
    74108
    74110
    74112
    74114
    74115
    74116
    74117
    74119
    74120
    74121
    74126
    74127
    74128
    74129
    74130
    74131
    74132
    74133
    74134
    74135
    74136
    74137
    74141
    74145
    74146
    74147
    74148
    74149
    74150
    74152
    74153
    74155
    74156
    74157
    74158
    74159
    74169
    74170
    74171
    74172
    74182
    74186
    74187
    74192
    74193
  )

  SHIPPING_RATE_PER_POUND = 1

  def shipping
    if po_box?
      base_shipping * 2
    elsif TULSA_ZIPS.include?(zip)
      0
    else
      base_shipping
    end
  end

  def base_shipping
    BigDecimal.new(cart.products.pluck(:weight).map { |w| w / 16.0 * SHIPPING_RATE_PER_POUND }.sum, 10).round(2)
  end

  def po_box?
    address1 =~ /p\.?\s*o\.?\s+box/
  end

  def total
    cart.products.sum(:cost) + tax + shipping
  end

  def product_total
    cart.products.sum(:cost)
  end
end
