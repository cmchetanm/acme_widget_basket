require_relative '../lib/product'
require_relative '../lib/basket'

catalog = {
  "R01" => Product.new(code: "R01", name: "Red Widget", price: 32.95),
  "G01" => Product.new(code: "G01", name: "Green Widget", price: 24.95),
  "B01" => Product.new(code: "B01", name: "Blue Widget", price: 7.95)
}

basket = Basket.new(catalog: catalog)
basket.add("R01")
basket.add("G01")

puts "Total: $#{'%.2f' % basket.total}"
