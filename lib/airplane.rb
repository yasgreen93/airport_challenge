class Airplane
  attr_reader :flying

  def initialize
    @flying = false
  end

  def land_plane!
    raise 'Plane already landed' if self.flying == false
    @flying = false
  end

  def take_off!
    raise 'Plane already taken off' if self.flying == true
    @flying = true
  end

end
