class Distance
  def initialize(original_location, destination_location)
    @original_location = original_location
    @destination_location = destination_location
  end

  def call
    orig = get_coordinates(@original_location)
    dest = get_coordinates(@destination_location)
    Geocoder::Calculations.distance_between(orig, dest, units: :km).round(2)
  end

  private

  def get_coordinates(location)
    Geocoder.coordinates(location)
  end
end
