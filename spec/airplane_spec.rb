require 'airplane'

describe Airplane do
  subject(:plane) {described_class.new}
  let(:airport) {double :airport, :planes => [], :receive => true, :send_away => true}

  it 'should not be landed when a new plane is initialized' do
    expect(plane.flying).to eq false
  end

  describe '#land_plane!' do
    it 'should not allow landing if already landed' do
      message = 'Plane already landed'
      expect{ plane.land_plane! }.to raise_error message
    end

    it 'should change the flying status to false' do
      plane.take_off!
      plane.land_plane!
      expect(plane.flying).to eq false
    end
  end

  describe '#take_off!' do
    it 'should not take off if already taken off' do
      plane.take_off!
      message = 'Plane already taken off'
      expect { plane.take_off! }.to raise_error message
    end
  end

end
