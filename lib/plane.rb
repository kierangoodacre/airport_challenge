require_relative 'weather'

class Plane

  include Weather
  
  def initialize
  	@in_the_air = false
  end

  def take_off!
    @in_the_air = true
    self
  end

  def in_the_air?
  	@in_the_air
  end

  def land!
  	@in_the_air = false
    self
  end

end