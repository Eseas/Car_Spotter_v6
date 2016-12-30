require 'rails_helper'
describe PriceUtility do
  it 'calculates bill for credit' do
    expect(described_class.calculate_bill_for_credit(100)).to eq(10)
  end

  it 'calculates credit cost for extra photo' do
    expect(described_class.calculate_credit_cost_for_extra_photo(5)).to eq(500)
  end
end
