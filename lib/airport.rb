require_relative 'airplane'
require_relative 'weather'

class Airport

  DEFAULT_VALUE = 10
  attr_reader :hangar, :capacity

  def initialize(capacity=DEFAULT_VALUE, weather_class)
    @hangar = []
    @capacity = capacity
    @weather = weather_class.new
  end

  def planes_in_hangar
    @hangar.each_with_index do |plane, index|
      puts "Bay #{index + 1}: #{plane}"
    end
  end

  def receive(plane)
    raise 'Too stormy to land' if stormy?
    raise 'Airport is full' if full?
    plane.land_plane!
    @hangar << plane
  end

  def send_away(plane)
    raise 'Too stormy to take off' if stormy?
    plane.take_off!
    raise 'Plane not at that airport' if not_at_that_airport(plane)
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
