class DeliveryRule
  attr_reader :min_total, :max_total, :charge

  def initialize(min_total:, max_total:, charge:)
    @min_total = min_total
    @max_total = max_total
    @charge = charge
  end

  def applies_to?(total)
    total >= min_total && total < max_total
  end
end
