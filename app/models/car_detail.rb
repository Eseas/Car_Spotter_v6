# This class is responsible
# for
class CarDetail < ApplicationRecord
  belongs_to :car

  validates :lic, uniqueness: { scope: :car_id }
  validates :make, length: { maximum: 20 }
  validates :model, length: { maximum: 40 }
  validates :year, length: { maximum: 4 }

  def ==(other)
    make == other.make &&
      model == other.model &&
      year == other.year
  end
end
