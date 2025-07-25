class Basket
  def initialize(catalog:, delivery_rules: [], offers: [])
    @catalog = catalog
    @delivery_rules = delivery_rules
    @offers = offers
    @items = []
  end

  def add(product_code)
    product = @catalog[product_code]
    raise "Invalid product code: #{product_code}" unless product
    @items << product
  end

  def total
    subtotal = apply_offers(@items.dup)
    delivery_charge = calculate_delivery(subtotal)
    (subtotal + delivery_charge).round(2)
  end

  private

  def apply_offers(items)
    @offers.reduce(sum_prices(items)) do |total, offer|
      offer.apply(items, total)
    end
  end

  def sum_prices(items)
    items.map(&:price).sum
  end

  def calculate_delivery(subtotal)
    rule = @delivery_rules.find { |rule| rule.applies_to?(subtotal) }
    rule ? rule.charge : 0.0
  end
end
