class TaxCalculatorService
  def initialize(order)
    @order = order
  end

  def call
    taxjar.rates_for_location(@order.zip).combined_rate * taxable_amount / 100
  end

  private

  SHIPPING_IS_TAXABLE_IN_THESE_STATES = %w(AR CO CT DC FL GA HI IL IN KS KY MI MN MS MO NE NJ NM NY NC ND OH PA RI SC SD TN TX VT WA WV WI)

  def taxable_amount
    if SHIPPING_IS_TAXABLE_IN_THESE_STATES.include?(@order.state)
      @order.product_total + @order.shipping
    else
      @order.product_total
    end
  end

  def taxjar
    @taxjar ||= Taxjar::Client.new(api_key: ENV['TAXJAR_API_KEY'])
  end
end
