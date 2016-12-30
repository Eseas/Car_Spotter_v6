# The Car class is responsible for managing:
#   primary and optional details;
#   primary and optional decoders;
#   photos.
class StatisticUtility
  def self.count_sessions
    Session.calculate(:count, :all)
  end

  def self.calculate_profit
    Customer.sum('bill')
  end

  def self.count_cars
    Car.calculate(:count, :all)
  end
end
