require 'rails_helper'
describe StatisticUtility do
  it 'counts users' do
    expect(described_class.count_sessions).to be >= 0
  end

  it 'counts cars' do
    expect(described_class.count_cars).to be >= 0
  end

  it 'calculates profit' do
    expect(described_class.calculate_profit).to be >= 0
  end
end
