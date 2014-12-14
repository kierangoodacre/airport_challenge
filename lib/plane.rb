require_relative 'weather'

class Plane

  include Weather
  
  def initialize
  	@plane = false
  end

  def take_off!
  	# @weather.probability
    @plane = true
  end

  def in_the_air?
  	@plane
  end

  def land!
  	@plane = false
  end

end