
class Weather
  attr_reader :stormy, :num

  def initialize
    @num = rand(3)
    @stormy = @num <= 1 ? false : true
  end

end
