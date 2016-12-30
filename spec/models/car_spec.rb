require 'rails_helper'

RSpec.describe Car, type: :model do
  it 'changes comment' do
    car = Car.first
    car.change_comment('Car became even better!')
    expect(car.comment).to include('better!')
  end
end
