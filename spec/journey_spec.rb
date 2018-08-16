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

  describe '#complete?' do
    # let(:voyage) { double :start("old st") :finish("aldgate") }
    context 'when journey is complete' do
      it 'returns true' do
        journey.start("station1")
        journey.finish("station2")
        expect(journey.complete?).to be
      end
    end

    context 'when journey is not complete' do
      it 'returns false: start missing' do
        journey.finish("station2")
        expect(journey.complete?).to be_falsey
      end

      it 'returns false: finish missing' do
        journey.start("station1")
        expect(journey.complete?).to be_falsey
      end
    end
  end

  describe '#fare' do
    context 'when journey is complete' do
      it 'returns minimum fare' do
        journey.start("station1")
        journey.finish("station2")
        expect(journey.fare).to eq(Oystercard::MINIMUM_FARE)
      end
    end

    context 'when journey is not complete' do
      it 'returns penalty fare' do
        journey.finish("station2")
        expect(journey.fare).to eq(Journey::PENALTY_FARE)
      end
    end
  end
end
