class Airport

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
		@planes.delete(plane)
	end

	def full?
		plane_count == @capacity
	end

end