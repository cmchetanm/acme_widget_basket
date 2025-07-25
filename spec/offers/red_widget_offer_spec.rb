# frozen_string_literal: true

RSpec.describe RedWidgetOffer do
  let(:offer) { RedWidgetOffer.new }
  let(:r01)   { Product.new(code: 'R01', name: 'Red Widget', price: 32.95) }

  it 'applies 50% discount on second R01' do
    items = [r01, r01]
    total = items.map(&:price).sum
    expected_total = (32.95 + 16.47).round(2)
    expect(offer.apply(items, total).round(2)).to eq(expected_total)
  end

  it 'does not apply discount to single R01' do
    items = [r01]
    total = items.map(&:price).sum
    expect(offer.apply(items, total).round(2)).to eq(32.95)
  end

  it 'applies discount to each second R01 in even count' do
    items = [r01, r01, r01, r01]
    total = items.map(&:price).sum
    expected_discount = (32.95 / 2) * 2.round(2)
    expected_total = (total - expected_discount).round(2)
    expect(offer.apply(items, total).round(2)).to eq(expected_total)
  end

  it 'applies discount only for complete pairs' do
    items = [r01, r01, r01]
    total = items.map(&:price).sum
    expected_discount = (32.95 / 2).round(2)
    expected_total = (total - expected_discount).round(2)
    expect(offer.apply(items, total).round(2)).to eq(expected_total)
  end
end
