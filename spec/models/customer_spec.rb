require 'rails_helper'
describe Customer do
  let(:session) { Session.create(username: 'newuser') }
  let(:customer) do
    session.create_customer(bill: 0, credit: 1000, max_photo: 2)
  end

  it 'purchases credit' do
    purchase_bill = PriceUtility.calculate_bill_for_credit(200)

    customer.purchase_credit(200, purchase_bill)

    expect(customer.bill).to eq(purchase_bill)
  end

  it 'purchases number of max photos increment and max photos increased' do
    purchase_credit_cost = PriceUtility.calculate_credit_cost_for_extra_photo(2)

    customer.purchase_max_photo_increment(2, purchase_credit_cost)
    expect(customer.max_photo).to eq(4)
  end

  it 'purchases number of max photos increment and credits are removed' do
    credit_cost = PriceUtility.calculate_credit_cost_for_extra_photo(2)

    customer.purchase_max_photo_increment(2, credit_cost)
    expect(customer.credit).to eq(1000 - credit_cost)
  end

  it 'does not change credit when purchasing max photo increment '\
     'without having enough credits' do
    credit_cost = PriceUtility.calculate_credit_cost_for_extra_photo(100)

    customer.purchase_max_photo_increment(100, credit_cost)
    expect(customer.credit).to eq(1000)
  end
end
