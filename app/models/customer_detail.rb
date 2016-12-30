# This class is responsible
# for
class CustomerDetail < ApplicationRecord
  belongs_to :session

  validates :email, uniqueness: true

  def ==(other)
    email == other.email &&
      name == other.name &&
      surname == other.surname
  end
end
