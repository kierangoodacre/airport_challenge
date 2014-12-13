require 'plane'
require 'weather'

describe Weather do

	let (:weather) {Weather.new}

	it "should be able to not have good weather" do
		weather = Weather.new
		weather.bad!
		expect(weather).to be_good
	end

	it "should be able to be good weather" do
		expect(weather).not_to be_good
	end

	it "should have a probability of either good or bad weather" do
		weather.probability
		expect((1..100).to_a.include?(weather)).to eq(false)
	end

end