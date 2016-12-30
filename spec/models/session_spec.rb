require 'rails_helper'
RSpec.describe Session, type: :model do
  fixtures :sessions, :credentials, :customers, :customer_details, :cars

  it 'saves session to db' do
    dummy = Session.new(username: 'newuser')
    Session.create(username: 'newuser')
    expect(Session.find_by(username: 'newuser') == dummy).to be true
  end

  it 'does NOT save session to db when username already exists' do
    session = Session.create(username: 'eseas')
    expect(session.id).to be_nil
  end

  it 'saves session credential to db' do
    dummy = Credential.new(password: 'Password2')
    session = Session.create(username: 'newuser')
    session.create_credential(password: 'Password2')
    expect(Credential.find_by(session_id: session.id) == dummy).to be true
  end

  it 'saves session customer to db' do
    dummy = Customer.new(bill: 0, credit: 200, max_photo: 2)
    session = Session.create(username: 'newuser')
    session.create_customer(bill: 0, credit: 200, max_photo: 2)
    expect(Customer.find_by(session_id: session.id) == dummy).to be true
  end

  it 'saves session customer detail to db' do
    dummy = CustomerDetail.new(email: 'newuser@gmail.com', name: 'Kazimieras',
                               surname: 'Senvaitis')
    session = Session.create(username: 'newuser')
    session.create_customer_detail(email: 'newuser@gmail.com',
                                   name: 'Kazimieras',
                                   surname: 'Senvaitis')
    expect(CustomerDetail.find_by(session_id: session.id) == dummy).to be true
  end

  it 'does NOT save customer detail to db when email already exists' do
    session = Session.create(username: 'newuser')
    customer_detail = session.create_customer_detail(
      email: 'kazimieras.senvaitis@gmail.com',
      name: 'Kazimieras', surname: 'Senvaitis'
    )
    expect(customer_detail.id).to be_nil
  end

  it 'saves session cars detail to db' do
    session = Session.create(username: 'newuser')
    pug = session.cars.create(comment: 'Best car ever!')
    pug.create_car_detail(make: 'Peugeot', model: '406',
                          year: '2002', lic: 'HBT428')

    bmw = session.cars.create(comment: 'Big car!')
    bmw.create_car_detail(make: 'BMW', model: '640i',
                          year: '2013', lic: 'BMW640')

    expect(Car.find_by(session_id: session.id, id: bmw.id)).to be_truthy
  end
end
