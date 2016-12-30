describe DecoderUtility do
  let(:peugeot_image) { File.new('p406c.jpg', 'r') }
  let(:ford_image) { File.new('GT90concept.jpg', 'r') }
  let(:register) { instance_double('Register') }
  let(:lic_decoder_engine) { instance_double('LicDecoderEngine') }
  let(:decoder_utility) { described_class.new(lic_decoder_engine, register) }
  before(:each) do
    lic = 'HBT428'
    allow(register).to receive(:find_make).with(lic) { 'Peugeot' }
    allow(register).to receive(:find_model).with(lic) { '406' }
    allow(register).to receive(:find_year).with(lic) { '2002' }

    allow(lic_decoder_engine).to receive(:find_lic).with(peugeot_image) do
      'HBT428'
    end
    allow(lic_decoder_engine).to receive(:find_lic).with(ford_image) { nil }
    allow(lic_decoder_engine).to receive(:available).with('v2016') { true }
    allow(lic_decoder_engine).to receive(:available).with('v2017') { false }
  end

  it 'reads data from regitra database' do
    expect(register).to receive(:find_model).with('HBT428')

    decoder_utility.decode_detail('HBT428')
  end

  it 'reads data from regitra database' do
    dummy_detail = CarDetail.new(make: 'Peugeot', model: '406', year: '2002')
    expect(decoder_utility.decode_detail('HBT428') == dummy_detail).to be true
  end

  it 'makes call to lic decoder engine with right args' do
    expect(lic_decoder_engine).to receive(:find_lic).with(peugeot_image)

    decoder_utility.decode_lic(peugeot_image, '2016-11-23')
  end

  it 'doesnt receive' do
    expect(lic_decoder_engine).not_to receive(:find_lic).with(peugeot_image)

    decoder_utility.decode_lic(peugeot_image, '2016-01-10')
  end

  it 'does not decode car lic without clear license plate' do
    expect(decoder_utility.decode_lic(ford_image, '2016-11-23')).to be nil
  end
end
