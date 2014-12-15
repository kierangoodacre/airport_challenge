require_relative 'weather'

class Airport

include Weather

	DEFAULT_CAPACITY = 20
	
	def initialize (options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@planes = []
	end

	def plane_count
		@planes.count
	end

	def land(plane)
		raise "Airport is full" if full?
		raise "Cannot land in bad weather" if self.probability == :bad
		@planes << plane
		plane.land!
	end

	def take_off(plane)
		raise "Weather is bad" if self.probability == :bad
		plane.take_off!
		@planes.delete(plane)
	end

	def full?
		plane_count == @capacity
	end

end