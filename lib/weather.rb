module Weather
	
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
    forecast = rand(1..101)
    if forecast < 10
      @weather.bad!
    else forecast > 10
      @weather.good?
    end
  end
    # if @weather = inlude?(1..90)
    #   false
    # else @weather = inlcude?(91..101)
    #   true
    # end

end

# change this line:  "if forecast.to_a.include?(1..10) == true" to "if forecast < 10 "

# 2.1.2 :013 > def prob
# 2.1.2 :014?>  forecast = rand(1..101)
# 2.1.2 :015?>    p forecast
# 2.1.2 :016?>  if forecast < 10
# 2.1.2 :017?>     
# 2.1.2 :018 >        @weather = 'bad'
# 2.1.2 :019?>    else
# 2.1.2 :020 >        @weather = 'good'
# 2.1.2 :021?>    end
# 2.1.2 :022?>  p @weather
# 2.1.2 :023?>  end