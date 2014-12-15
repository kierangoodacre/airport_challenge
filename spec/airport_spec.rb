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
		allow(airport).to receive(:probability).and_return(:bad)
		expect(airport.plane_count).to eq(0)
	end

	it "should know when it is full" do
		expect(airport).not_to be_full
		20.times { airport.dock(plane) }
		expect(airport).to be_full
	end

	it "should check the weather forecats" do
		allow(airport).to receive(:probability)
	end

	it "should refuse clearance for take off in bad weather" do
		expect(airport).to receive(:probability).and_return(:bad)
		airport.dock(plane)
		expect(airport.plane_count).to eq(1)
		expect{ airport.cleared(plane) }.to raise_error(RuntimeError, "Weather is bad")
	end

	# expect(lambda {holder.release('banana')}).to raise_error(RuntimeError, "banana is not a bike"

	# it"should not be able to take off in bad weather" do
	# 	plane.take_off!
	# 	weather.bad!
	# 	expect { lambda { plane.take_off! }}.to raise_error(Runtime error, "weather is bad, plane cannot take off")
	# end


end