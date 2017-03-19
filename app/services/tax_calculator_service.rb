class TaxCalculatorService
  def initialize(order)
    @order = order
  end

  def call
    taxjar.rates_for_location(@order.zip).combined_rate * @order.total / 100
  end

  private

  def taxjar
    @taxjar ||= Taxjar::Client.new(api_key: ENV['TAXJAR_API_KEY'])
  end
end
