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

	def dock(plane)
		@planes << plane
	end

	def cleared(plane)
		raise "Weather is bad" if self.probability == :bad
		plane.take_off!
		@planes.delete(plane)
	end

	def full?
		plane_count == @capacity
	end

end