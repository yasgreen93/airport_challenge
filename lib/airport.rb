require_relative 'airplane'
require_relative 'weather'

class Airport

  DEFAULT_VALUE = 10
  attr_reader :hangar, :planes, :capacity

  def initialize(capacity=DEFAULT_VALUE, weather_class)
    @hangar = []
    @capacity = capacity
    @weather = weather_class.new
  end

  def planes_in_hangar
    @planes = []
    @hangar.each_with_index do |plane, index|
      planes.push("Bay #{index + 1}: #{plane}")
    end
    return @planes
  end

  def receive(plane)
    raise 'Too stormy to land' if stormy?
    raise 'Airport is full' if full?
    plane.land_plane!
    @hangar << plane
  end

  def send_away(plane)
    raise 'Too stormy to take off' if stormy?
    raise 'Plane not at that airport' if not_at_that_airport(plane)
    plane.take_off!
    @hangar.delete(plane)
  end

private

  def full?
    hangar.size >= @capacity
  end

  def stormy?
    @weather.stormy
  end

  def not_at_that_airport(plane)
    !hangar.include? plane
  end

end
