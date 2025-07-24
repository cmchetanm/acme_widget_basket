require_relative '../lib/basket'
require_relative '../lib/product'
require_relative '../lib/delivery_rule'

RSpec.describe Basket do
  let(:catalog) do
    {
      "R01" => Product.new(code: "R01", name: "Red Widget", price: 32.95),
      "G01" => Product.new(code: "G01", name: "Green Widget", price: 24.95),
      "B01" => Product.new(code: "B01", name: "Blue Widget", price: 7.95)
    }
  end

  let(:delivery_rules) do
    [
      DeliveryRule.new(min_total: 0, max_total: 50, charge: 4.95),
      DeliveryRule.new(min_total: 50, max_total: 90, charge: 2.95),
      DeliveryRule.new(min_total: 90, max_total: Float::INFINITY, charge: 0.0)
    ]
  end

  let(:basket) { Basket.new(catalog: catalog, delivery_rules: delivery_rules) }

  it "adds a product by code" do
    basket.add("R01")
    expected_total = (32.95 + 4.95).round(2)
    expect(basket.total).to eq(expected_total)
  end

  it "raises error for invalid product" do
    expect { basket.add("X99") }.to raise_error("Invalid product code: X99")
  end

  it "applies correct delivery charge under $50" do
    basket.add("B01")
    basket.add("G01")
    expect(basket.total).to eq(32.90 + 4.95)
  end

  it "applies correct delivery charge under $90" do
    basket.add("R01")
    basket.add("G01")
    expect(basket.total).to eq(57.90 + 2.95)
  end

  it "applies free delivery for >= $90" do
    3.times { basket.add("R01") }
    expect(basket.total).to eq(98.85)
  end
end
