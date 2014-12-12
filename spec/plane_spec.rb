require './lib/plane'

describe Plane do
    
  it 'should not take off after we create it' do
    the_plane = Plane.new
    expect(the_plane).not_to be_taking_off
  end
  
end