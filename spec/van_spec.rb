require './lib/van'
require './spec/bike_container_spec'

describe Van do
	it_behaves_like 'a bike container'
end