require 'station'
describe Station do
  subject {described_class.new(name: "Aldgate", zone: 1)}

# let(:station1)  { described_class.new(name, zone) }
# let(:station)   { double :station }
# let(:zone)      { double :zone }

  # describe "#initialize" do
  #   it "text" do
  #     expect(Station).to respond_to(:new).with(2).arguments
  #   end

  it "knows its name" do
    expect(subject.name).to eq("Aldgate")
  end

  it "knows its zone" do
    expect(subject.zone).to eq(1)
  end

    # describe ".name" do
    #   it "assigns argument" do
    #     expect(station1.name).to eq(station)
    #   end
    # end
    #
    # describe ".zone" do
    #   it "assigns argument" do
    #     expect(station1.zone).to eq(zone)
    #   end
    # en
end
