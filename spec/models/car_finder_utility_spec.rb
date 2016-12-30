require 'rails_helper'
describe CarFinderUtility do
  fixtures :sessions, :credentials, :customers,
           :customer_details, :cars, :car_details, :photos

  it 'finds car by details' do
    session = sessions(:eseas)
    dummy = CarDetail.new(make: 'BMW', model: '640i',
                          year: '2013', lic: 'BMW640')

    car_finder_utility = described_class.new(session, 'BMW', '640i', '2013')
    loaded_bmw = car_finder_utility.find_car

    expect(loaded_bmw.car_detail == dummy).to be true
  end
end
