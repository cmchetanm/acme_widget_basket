# frozen_string_literal: true

require_relative '../lib/loader'

catalog = {
  'R01' => Product.new(code: 'R01', name: 'Red Widget', price: 32.95),
  'G01' => Product.new(code: 'G01', name: 'Green Widget', price: 24.95),
  'B01' => Product.new(code: 'B01', name: 'Blue Widget', price: 7.95)
}

delivery_rules = [
  DeliveryRule.new(min_total: 0, max_total: 50, charge: 4.95),
  DeliveryRule.new(min_total: 50, max_total: 90, charge: 2.95),
  DeliveryRule.new(min_total: 90, max_total: Float::INFINITY, charge: 0.0)
]

offers = [
  RedWidgetOffer.new
]

basket = Basket.new(
  catalog: catalog,
  delivery_rules: delivery_rules,
  offers: offers
)

%w[B01 G01].each { |code| basket.add(code) }

puts "Total: $#{'%.2f' % basket.total}"
