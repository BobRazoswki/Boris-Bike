require './lib/bike' 

module BikeContainer

DEFAULT_CAPACITY = 20

	def bikes
		@bikes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def bike_count
		bikes.count
	end

	def full?
		bike_count == capacity
	end

	def available_bikes_is_not_empty?
		!available_bikes.empty?
	end

	def bike_does_exist
		bikes.include?(bike)
	end

	def available_bikes
		bikes.reject {|bike| bike.broken?}
	end

	def dock(bike)
		raise 'the dock is full mate' if full?
		raise 'this is not a bike' unless bike.is_a?(Bike)
		bikes << bike
	end

	def release(bike)
		raise "No disponible bikes, sorry" unless available_bikes_is_not_empty?
		raise "The bike does not exist" unless available_bikes.include?(bike)
		bikes.delete(bike)
	end	

	



end