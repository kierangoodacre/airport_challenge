require './lib/plane'
require 'weather'

# class WeatherForecast; include Weather; end

describe Plane do

  let (:plane) {Plane.new}
  # let (:weather) {WeatherForecast.new}
    
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

  # it "should not be able to take off in bad weather" do
  #   plane.take_off!
  #   expect { lambda { plane.take_off! }}.to raise_error(Runtime error, "Weather is bad, plane cannot take off")
  # end


  # it"should not be able to take off in bad weather" do
  #   plane.take_off!(weather)
  #   # expect { lambda { plane.take_off! }}.to raise_error(Runtime error, "Weather is bad, plane cannot take off")
  # end


  
end

  # it "should not be able to take off if weather is bad" do
  #   plane.take_off!
  #   weather.bad!
  #   expect(plane).not_to be_in_the_air
  # end

  
# end