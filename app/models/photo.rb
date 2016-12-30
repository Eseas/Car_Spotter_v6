# This class is responsible
# for
class Photo < ApplicationRecord
  belongs_to :car

  def decode_lic
    File.new(filename, 'r').readline.chomp
  end
end
