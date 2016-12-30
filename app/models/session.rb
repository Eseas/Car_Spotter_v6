# This class is responsible
# for
class Session < ApplicationRecord
  has_many :cars
  has_one :customer
  has_one :credential
  has_one :customer_detail

  validates :username, presence: true
  validates :username, uniqueness: true

  def ==(other)
    username == other.username
  end
end
