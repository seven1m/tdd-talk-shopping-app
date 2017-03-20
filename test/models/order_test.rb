require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'tulsa zip code gets free shipping' do
    order = Order.new(zip: '74137')
    assert_equal(0, order.shipping)
  end

  test 'regular shipping' do
    cart = carts(:one)
    order = Order.new(cart: cart)
    assert_equal(3, order.shipping)
  end

  test 'PO boxes get double shipping' do
    cart = carts(:one)
    order = Order.new(address1: 'P.O. Box 123', cart: cart)
    assert_equal(6, order.shipping)
    order = Order.new(address1: 'po box 1', cart: cart)
    assert_equal(6, order.shipping)
  end

  test 'tax for bixby' do
    cart = carts(:one)
    order = Order.new(zip: '74008', cart: cart)
    assert_equal(7.39, order.tax)
  end

  test 'tax for new york city' do
    cart = carts(:one)
    order = Order.new(zip: '10001', cart: cart)
    assert_equal(6.66, order.tax)
  end
end
