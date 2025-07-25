require_relative '../lib/product'

RSpec.describe Product do
  let(:product) { Product.new(code: "R01", name: "Red Widget", price: 32.95) }

  it "has a code" do
    expect(product.code).to eq("R01")
  end

  it "has a name" do
    expect(product.name).to eq("Red Widget")
  end

  it "has a price" do
    expect(product.price).to eq(32.95)
  end
end
