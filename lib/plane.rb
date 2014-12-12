class Plane
  
  def initialize
  	@plane = false
  end

  def take_off!
  	@plane = true
  end

  def in_the_air?
  	@plane
  end

  def land!
  	@plane = false
  end

end