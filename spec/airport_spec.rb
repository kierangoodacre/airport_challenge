require 'airport'

describe Airport do

	let (:plane) {double :plane, land!: nil, take_off!: nil}
	let (:airport) { Airport.new(capacity: 60) }

	def fill_spaces
		airport.capacity.times { airport.land(plane) }
	end

	context "good weather" do
		before{allow(airport).to receive(:probability).and_return(:good) }

		it "should be able to land" do
			# expect(airport.plane_count).to eq(0)
			# airport.land(plane)
			# expect(airport.plane_count).to eq(1)			
			expect{airport.land(plane)}.to change{airport.plane_count}.by 1
		end

		it "should be cleared for take off" do
			airport.land(plane)
			# expect(airport.plane_count).to eq(1)
			# airport.take_off(plane)
			# expect(airport.plane_count).to eq(0)
			expect{airport.take_off(plane)}.to change{airport.plane_count}.by -1
		end

		it "should know when it is full" do
			fill_spaces
			expect(airport).to be_full
			# expect( lambda { airport.land(plane) }).to raise_error(RuntimeError, "Airport is full")
		end

		it "Planes should not be able to land if full" do
			fill_spaces
			expect( lambda { airport.land(plane) }).to raise_error(RuntimeError, "Airport is full")
		end

	end

	context 'bad weather' do
		before{allow(airport).to receive(:probability).and_return(:bad) }

		it "should refuse clearance for take off in bad weather" do
			expect{ airport.take_off(plane) }.to raise_error(RuntimeError, "Weather is bad")
		end

		it "planes should not be able to land in bad weather" do
			# airport.take_off(plane)
			# expect(airport.plane_count).to eq(0)
			expect{ airport.land(plane) }.to raise_error(RuntimeError, "Weather is bad")
		end
	end
end