# frozen_string_literal: true

class RedWidgetOffer
  TARGET_CODE = 'R01'

  def apply(items, total)
    r01s = items.select { |item| item.code == TARGET_CODE }

    return total if r01s.size < 2

    price = r01s.first.price
    discount = ((r01s.size / 2) * price / 2.0).round(2)

    (total - discount).round(2)
  end
end
