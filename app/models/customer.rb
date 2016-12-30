# This class is responsible
# for
class Customer < ApplicationRecord
  belongs_to :session

  validates :session_id, presence: true

  def purchase_credit(credit, bill)
    self.credit += credit
    self.bill += bill
  end

  def purchase_max_photo_increment(increment, credit_cost)
    return unless self.credit >= credit_cost
    increase_max_photo_and_reduce_credit(increment, credit_cost)
  end

  def increase_max_photo_and_reduce_credit(increment, credit_cost)
    self.max_photo += increment
    self.credit -= credit_cost
  end

  def ==(other)
    bill == other.bill &&
      credit == other.credit &&
      max_photo == other.max_photo
  end
end
