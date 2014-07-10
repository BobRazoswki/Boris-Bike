require './lib/bike_container'

class DockingStation

include BikeContainer

	def initialize(capacity: DEFAULT_CAPACITY)
		@capacity = capacity
	end
end