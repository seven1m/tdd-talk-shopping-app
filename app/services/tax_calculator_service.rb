class TaxCalculatorService
  def initialize(order)
    @order = order
  end

  def call
    BigDecimal.new(taxjar.rates_for_location(@order.zip).combined_rate * @order.product_total, 10).round(2)
  end

  private

  def taxjar
    @taxjar ||= Taxjar::Client.new(api_key: ENV['TAXJAR_API_KEY'])
  end
end
