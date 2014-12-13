require './lib/plane'

describe Plane do

  let (:plane) {Plane.new}
    
  it 'should not take off after we create it' do
    expect(plane).not_to be_in_the_air
  end

  it 'should be able to take off' do
  	plane.take_off!
  	expect(plane).to be_in_the_air
  end

  it "should be able to land" do
  	plane.take_off!
  	plane.land!
  	expect(plane).not_to be_in_the_air
  end

  # it "should not be able to take off if weather is bad" do
  #   plane.take_off!
  #   weather.bad!
  #   expect(plane).not_to be_in_the_air
  # end

  
end