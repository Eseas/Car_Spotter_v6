require 'rails_helper'

RSpec.describe Photo, type: :model do
  it 'decodes lic from file' do
    photo = Photo.new(filename: 'p406c.txt')
    lic = photo.decode_lic
    expect(lic).to eq('HBT428')
  end
end
