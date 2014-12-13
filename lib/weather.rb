class Weather
	
  def initialize
    @weather = false
  end

	def bad!
    @weather = true
	end

  def good?
    @weather
  end

  def probability
    @weather = rand(1..100)
  end

end