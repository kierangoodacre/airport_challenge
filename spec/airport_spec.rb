require 'airport'

describe Airport do

	let (:plane) { Plane.new }
	let (:airport) { Airport.new(capacity: 20) }
	# let (:weather) double { Weather.new }

	it "should be able to dock plane" do
		expect(airport.plane_count).to eq(0)
		airport.dock(plane)
		expect(airport.plane_count).to eq(1)
	end

	it "should be cleared for take off" do
		airport.dock(plane)
		expect(airport.plane_count).to eq(1)
		airport.cleared(plane)
		expect(airport.plane_count).to eq(0)
	end

	it "should know when it is full" do
		expect(airport).not_to be_full
		20.times { airport.dock(plane) }
		expect(airport).to be_full
	end

	# it"should not be able to take off in bad weather" do
	# 	plane.take_off!
	# 	weather.bad!
	# 	expect { lambda { plane.take_off! }}.to raise_error(Runtime error, "weather is bad, plane cannot take off")
	# end


end