class Airport
	
	def initialize
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

end