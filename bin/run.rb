require_relative '../lib/product'
require_relative '../lib/basket'
require_relative '../lib/delivery_rule'

catalog = {
  "R01" => Product.new(code: "R01", name: "Red Widget", price: 32.95),
  "G01" => Product.new(code: "G01", name: "Green Widget", price: 24.95),
  "B01" => Product.new(code: "B01", name: "Blue Widget", price: 7.95)
}

delivery_rules = [
  DeliveryRule.new(min_total: 0, max_total: 50, charge: 4.95),
  DeliveryRule.new(min_total: 50, max_total: 90, charge: 2.95),
  DeliveryRule.new(min_total: 90, max_total: Float::INFINITY, charge: 0.0)
]

basket = Basket.new(catalog: catalog, delivery_rules: delivery_rules)
basket.add("R01")
basket.add("G01")

puts "Total: $#{'%.2f' % basket.total}"
