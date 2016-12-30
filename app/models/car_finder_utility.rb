# This class is responsible
# for
class CarFinderUtility
  def initialize(session, make, model, year)
    @session = session
    @make = make
    @model = model
    @year = year
  end

  def find_car
    car_detail = CarDetail.find_by(make: @make, model: @model, year: @year)
    Car.find_by(session_id: @session.id, id: car_detail.car_id)
  end
end
