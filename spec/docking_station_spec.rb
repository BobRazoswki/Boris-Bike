require 'docking_station'

describe 'DockingStation' do
	let(:station) {DockingStation.new(:capacity => 20)}

	it 'should allow the docking station (when initialize) to have a default capacity' do 
		expect(station.capacity).to eq 20	
	end
end