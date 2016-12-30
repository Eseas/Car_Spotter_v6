# This class is responsible
# for
class PriceUtility
  def self.calculate_bill_for_credit(amount)
    amount / 10.0
  end

  def self.calculate_credit_cost_for_extra_photo(amount)
    amount * 100
  end
end
