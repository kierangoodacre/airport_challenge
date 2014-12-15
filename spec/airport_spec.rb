require 'airport'

describe Airport do

	let (:plane) { Plane.new }
	let (:airport) { Airport.new(capacity: 20) }
	# let (:weather) double { Weather.new }

	def fill_spaces
		20.times { airport.land(plane) }
	end

	it "should be able to land" do
		expect(airport.plane_count).to eq(0)
		allow(airport).to receive(:probability).and_return(:good)
		airport.land(plane)
		expect(airport.plane_count).to eq(1)
	end

	it "should be cleared for take off" do
		allow(airport).to receive(:probability).and_return(:good)
		airport.land(plane)
		expect(airport.plane_count).to eq(1)
		allow(airport).to receive(:probability).and_return(:good)
		airport.take_off(plane)
		expect(airport.plane_count).to eq(0)
	end

	it "should know when it is full" do
		allow(airport).to receive(:probability).and_return(:good)
		fill_spaces
		expect(airport).to be_full
		# expect( lambda { airport.land(plane) }).to raise_error(RuntimeError, "Airport is full")
	end

	it "Planes should not be able to land if full" do
		allow(airport).to receive(:probability).and_return(:good)
		fill_spaces
		expect( lambda { airport.land(plane) }).to raise_error(RuntimeError, "Airport is full")
	end

	it "should check the weather forecats" do
		allow(airport).to receive(:probability)
	end

	it "should refuse clearance for take off in bad weather" do
		allow(airport).to receive(:probability).and_return(:bad)
		expect{ airport.take_off(plane) }.to raise_error(RuntimeError, "Weather is bad")
	end

	it "planes should not be able to land in bad weather" do
		expect(airport).to receive(:probability).and_return(:bad)
		# airport.take_off(plane)
		# expect(airport.plane_count).to eq(0)
		expect{ airport.land(plane) }.to raise_error(RuntimeError, "Cannot land in bad weather")
	end

	# expect(lambda {holder.release('banana')}).to raise_error(RuntimeError, "banana is not a bike"

	# it"should not be able to take off in bad weather" do
	# 	plane.take_off!
	# 	weather.bad!
	# 	expect { lambda { plane.take_off! }}.to raise_error(Runtime error, "weather is bad, plane cannot take off")
	# end


end