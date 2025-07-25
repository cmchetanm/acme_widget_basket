require_relative '../lib/basket'
require_relative '../lib/product'

RSpec.describe Basket do
  let(:catalog) do
    {
      "R01" => Product.new(code: "R01", name: "Red Widget", price: 32.95),
      "G01" => Product.new(code: "G01", name: "Green Widget", price: 24.95),
      "B01" => Product.new(code: "B01", name: "Blue Widget", price: 7.95)
    }
  end

  let(:basket) { Basket.new(catalog: catalog) }

  it "adds a product by code" do
    basket.add("R01")
    expect(basket.total).to eq(32.95 + 4.95) # delivery assumed for now
  end

  it "raises error for invalid product" do
    expect { basket.add("X99") }.to raise_error("Invalid product code: X99")
  end
end
