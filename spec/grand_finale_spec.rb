require 'plane'
require 'airport'

describe "everything working together" do
	let(:airport){Airport.new}
	
	def fleet_land
		fleet = []
		6.times{fleet << Plane.new}
		fleet.each {|plane|airport.land(plane)}
	end

	it "can land 6 planes" do
		allow(airport).to receive(:probability).and_return :good
		fleet_land
		expect(airport.plane_count).to eq 6
	end

	it "6 planes can be landed" do
		allow(airport).to receive(:probability).and_return :good
		# fleet_land
		fleet = []
		6.times{fleet << Plane.new}
		fleet.each {|plane|airport.land(plane)}
		expect(fleet.map{|plane| plane.in_the_air?}.uniq).to eq [false]
	end

	it "6 planes can be in the air" do
		allow(airport).to receive(:probability).and_return :good
		fleet = []
		6.times{fleet << Plane.new}
		fleet.each {|plane|airport.land(plane)}
		fleet.each {|plane|airport.take_off(plane)}
		expect(fleet.map{|plane| plane.in_the_air?}.uniq).to eq [true]
	end

end