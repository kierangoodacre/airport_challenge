require 'plane'
require 'weather'

describe Weather do

	it "should be able to be bad" do
		weather = Weather.new
		expect(weather).to be_bad
	end


end