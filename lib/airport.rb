require_relative 'weather'

class Airport

include Weather

	DEFAULT_CAPACITY = 20
	attr_reader :capacity
	
	def initialize (options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@planes = []
	end

	def plane_count
		@planes.count
	end

	def land(plane)
		@planes << plane.land! if clear_for(:landing)
	end

	def take_off(plane)
		@planes.delete(plane.take_off!) if clear_for(:take_off)
	end

	def full?
		plane_count >= capacity
	end

	def clear_for action
		raise "Airport is full" if full? and action == :landing
		raise "Weather is bad" if probability == :bad
		true
	end

end