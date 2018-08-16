require 'journey'
describe Journey do
  let(:journey) { described_class.new(voyage: "voyage")}
  let(:station) { double :station }

  describe '#start' do
    it 'verifies that start pushes data to @voyage' do
      expect(journey.start(station)).to eq(start: station)
    end
  end

  describe '#finish' do
    it 'verifies that finish pushes data to @voyage' do
      expect(journey.finish(station)).to eq(finish: station)
    end
  end

  # check start and finish together (through the complete method?)

end
