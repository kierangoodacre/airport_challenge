require 'plane'
require 'weather'

class WeatherForecast; include Weather; end

describe Weather do

	let (:weather) {WeatherForecast.new}

	it "should be able to not have good weather" do
		weather.probability
		allow(weather).to receive(:probability).and_return(:bad)
	end

	it "should be able to be good weather" do
		weather.probability
		allow(weather).to receive(:probability).and_return(:good)
	end

	# it "should have a probability of either good or bad weather" do
 #    weather.probability
	# 	expect((1..10).include?(weather)).to eq(true)
 #    expect((10..101).include?(weather)).to eq(false)
	# end

end