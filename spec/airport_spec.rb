require 'airport'

describe Airport do

	it "should be able to dock plane" do
		plane = Plane.new
		airport = Airport.new
		expect(airport.plane_count).to eq(0)
		airport.dock(plane)
		expect(airport.plane_count).to eq(1)
	end

	it "should be cleared for take off" do
		plane = Plane.new
		airport = Airport.new
		airport.dock(plane)
		expect(airport.plane_count).to eq(1)
		airport.cleared(plane)
		expect(airport.plane_count).to eq(0)
	end

end