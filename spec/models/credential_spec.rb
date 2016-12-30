require 'rails_helper'
RSpec.describe Credential, type: :model do
  let(:session) { Session.create(username: 'newuser') }

  it 'negatively validates password with 0 small letters' do
    expect(described_class.create(session_id: session.id,
                                  password: 'PASSWORD').valid?).to be false
  end

  it 'negatively validates password with 0 capital letters' do
    expect(described_class.create(session_id: session.id,
                                  password: 'password3').valid?).to be false
  end

  it 'negatively validates password with 0 numbers' do
    expect(described_class.create(session_id: session.id,
                                  password: 'Password').valid?).to be false
  end

  it 'positively validates password with: >=8 symbols, >0 small letter,'\
     '>0 capital, >0 number' do
    expect(described_class.create(session_id: session.id,
                                  password: 'Password2').valid?).to be true
  end

  it 'positively validates password with: >=8 symbols, >0 small letter,'\
     '>0 capital, >0 number, complex symbols' do
    expect(described_class.create(session_id: session.id,
                                  password: 'P@$$w0rd2').valid?).to be true
  end
end
