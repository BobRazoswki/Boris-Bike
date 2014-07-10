require './lib/bike_container'

shared_examples 'a bike container' do

	let(:holder)       { described_class.new }

	let(:bike)         {double :bike, is_a?: Bike, broken?: false }
	let(:bike2)        {double :bike, is_a?: Bike, broken?: false }
	let(:working_bike) {double :bike, is_a?: Bike, broken?: false}
	let(:broken_bike)  {double :bike, is_a?: Bike, broken?: true }

	def fill_station
		holder.capacity.times { holder.dock(bike) }
	end

	context 'FILL' do

		it 'should accept a bike' do
			expect(holder.bike_count).to eq (0)
			holder.dock(bike)
			expect(holder.bike_count).to eq (1)
		end

		it 'should not allow an empty argument' do               
			expect{holder.dock()}.to raise_error(ArgumentError)
		end

		context 'FULL' do

			it "Should know when it is full" do
				expect(holder).not_to be_full
				fill_station
				expect(holder).to be_full
			end

			it 'Should raise an error message if the station is full' do
				fill_station
				expect{holder.dock(bike)}.to raise_error(RuntimeError)
			end

		end

	end

	context 'RELEASE' do

		it "should release a bike" do
			holder.dock(working_bike)
			holder.dock(broken_bike)
			holder.release(working_bike)
			expect(holder.bikes).to eq([broken_bike])
		end


		it 'try to release a bike that is not there' do
			holder.dock(bike)
			expect{ holder.release(broken_bike) }.to raise_error(RuntimeError)
		end


		it "should not release something that doesn't exist" do               
			expect{holder.release()}.to raise_error(ArgumentError)
		end

	end



	context 'AVAILABILITY' do

		it 'should know when the bike is available or not' do
			working = double bike, broken?: false, is_a?: Bike
			broken = double bike, broken?: true, is_a?: Bike
			holder.dock(working)
			holder.dock(broken)
			expect(holder.available_bikes).to eq [working]
		end

	end

end
