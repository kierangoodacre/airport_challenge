require './lib/plane'

describe Plane do
    
  it 'should not take off after we create it' do
    plane = Plane.new
    expect(plane).not_to be_taking_off
  end

  it 'should be able to take off' do
  	plane = Plane.new
  	plane.take_off!
  	expect(plane).to be_taking_off
  end
  
end