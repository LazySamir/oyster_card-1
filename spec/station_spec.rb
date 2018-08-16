require 'station'
describe Station do
let(:station1)  { described_class.new(station, zone) }
let(:station)   { double :station }
let(:zone)      { double :zone }

  describe "#initialize" do
    it "text" do
      expect(Station).to respond_to(:new).with(2).arguments
    end

    describe ".name" do
      it "assigns argument" do
        expect(station1.name).to eq(station)
      end
    end

    describe ".zone" do
      it "assigns argument" do
        expect(station1.zone).to eq(zone)
      end
    end
  end
end
