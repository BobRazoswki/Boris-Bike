require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe 'ContainerHolder' do

	let(:holder) {ContainerHolder.new} 
	let(:bike) {double :bike}
	let(:bike2) {double :bike}

	def fill_station
		20.times {holder.dock(bike)}
	end

	it 'should accept a bike' do
		expect(holder.bike_count).to eq (0)
		holder.dock(bike)
		expect(holder.bike_count).to eq (1)
	end

	it "should release a bike" do
		holder.dock(bike)
		holder.dock(bike2)
		holder.release(bike2)
		expect(holder.bikes).to eq([bike])
	end

	it "know when it is full" do
		expect(holder).not_to be_full
		fill_station
		expect(holder).to be_full
	end

	it 'should raise an error message' do
		fill_station
		expect{holder.dock(bike)}.to raise_error(RuntimeError)
	end

	it 'should know when the bike is available or not' do
		working = double bike, broken?: false
		broken = double bike, broken?: true
		holder.dock(working)
		holder.dock(broken)
		expect(holder.available_bikes).to eq [working]
	end

	it 'try to release a bike that is not there' do
		holder.dock(bike)
		expect{ holder.release(bike2)}.to raise_error(RuntimeError)
	end

	#it 'should not allow an empty argument' do
	#	holder.dock(nil)                      
	#	expect{holder.release(nil)}.to raise_error(ArgumentError)
	#end
	
	#it 'should accept only bikes' do
	#	holder.dock()
	#	expect(holder.dock(jjnj)).not_to dock(jjnj)
	#end
	
	it '' do
		
	end
	
	it '' do
		
	end

	it '' do
		
	end
end