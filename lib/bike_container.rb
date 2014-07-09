module BikeContainer
=begin 
	é? 
	Anything else that can go wrong? Write tests for it and make them pass. 
	Do the same for dock() method.
=end
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

	def dock(bike)
		raise 'Au Revoir Bob! Je suis desolé' if full?
		bikes << bike
	end

	def release(bike)
		raise "desolé, n'est pas bicyclette ici" unless bikes.include?(bike) 
		bikes.delete(bike)
	end	

	def full?
		bike_count == capacity
	end

	def available_bikes
		bikes.reject {|bike| bike.broken?}
	end

end