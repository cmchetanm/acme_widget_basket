require_relative '../lib/product'

catalog = {
  "R01" => Product.new(code: "R01", name: "Red Widget", price: 32.95),
  "G01" => Product.new(code: "G01", name: "Green Widget", price: 24.95),
  "B01" => Product.new(code: "B01", name: "Blue Widget", price: 7.95)
}

puts catalog["R01"].name
puts catalog["G01"].price