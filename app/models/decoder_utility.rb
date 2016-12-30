# This class is responsible
# for
class DecoderUtility
  def initialize(lic_decoder_engine, register)
    @register = register
    @lic_decoder_engine = lic_decoder_engine
  end

  def decode_lic(file, time)
    puts('Initiating decoding procedure...')
    #time = '2016-11-23'
    maintainance_time = '2016-11'
    if time.include?(maintainance_time)
      lic = @lic_decoder_engine.find_lic(file)
    end
      
    if lic
      puts('Decoding procedure successful!')
    else
      puts('Error: Unable to decode image. (E0001)')
    end
    lic
  end

  def decode_detail(lic)
    CarDetail.new(make: @register.find_make(lic),
                  model: @register.find_model(lic),
                  year: @register.find_year(lic))
  end
end
