require 'oystercard'

describe Oystercard do
let(:mockStation)     { double :station }
let(:mockStation2)    { double :station }

  it "knows its balance" do
    expect(subject.balance).to eq(Oystercard::DEFAULT_BALANCE)
    expect(described_class.new(5).balance).to eq(5)
  end

  it "knows its limit" do
      expect(subject.limit).to eq(90)
  end

  describe "#add_money" do
    it "tops up the card" do
      expect { subject.add_money(10) }.to change { subject.balance }.by +10
    end
    it "will not top up over .limit" do
      expect { subject.add_money(subject.limit+1) }.to raise_error("balance limit reached: #{subject.limit}")
    end
  end

# TEST DEDUCT MONEY INDIRECTLY
  # describe "#deduct_money" do
  #   it "will not deduct money if not enough on balance" do
  #     expect { subject.deduct_money(subject.limit+1) }.to raise_error("Insufficient balance, #{subject.balance} remaining")
  #   end
  # end

# moreJourney to pass to touch_out
      #
      # subject.touch_out(mockStation, mockJourney)
      # expect(subject.balance).to eq (Oystercard::DEFAULT_BALANCE - Oystercard::MINIMUM_FARE)

      # should this be in deduct_money or touch_out?
      # wants us to use this syntax
      # expect { subject.balance }.to change{}.by()

  # describe "#in_journey?" do
  #   it "returns false by default" do
  #     expect(subject.in_journey?).to eq false
  #   end
  # end

  describe "#touch_in" do
  #   it "assigns in_journey to true" do
  #     subject.touch_in(mockStation)
  #     expect(subject.in_journey?).to eq true
  #   end

    # describe ".entry_station" do
    #   it "return last station name" do
    #     subject.touch_in(mockStation)
    #     expect(subject.entry_station).to eq mockStation
    #   end
    # end
    context "while balance = 0" do
      let(:card0)        { described_class.new(0) }
      let(:mockJourney)  {double :journey}
      it "raises error if not enough funds" do
        expect { card0.touch_in(mockStation, mockJourney) }.to raise_error "balance below minimum: #{Oystercard::MINIMUM_FARE}"
      end
    end
  end

  describe "#touch_out" do
    # it "assigns in_journey to false" do
    #   subject.touch_in(mockStation)
    #   #is this too relient on touch_in working? set instance variable directly?
    #   subject.touch_out(mockStation)
    #   expect(subject.in_journey?).to eq false
    # end

    # it "assigns exit station" do
    #   subject.touch_in(mockStation)
    #   subject.touch_out(mockStation)
    #   expect(subject.exit_station).to eq(mockStation)
    #   # add a way to check journey for exit station
    #
    # end

    it "takes 2 arguments" do
      expect(subject).to respond_to(:touch_out).with(2).arguments
    end

    # describe ".entry_station" do
    #   it "return nil" do
    #     subject.touch_out(mockStation)
    #     expect(subject.entry_station).to eq nil
    #   end
    # end

    # describe ".journey_list" do
    #   it "stores journey" do
    #     subject.touch_in(mockStation)
    #     subject.touch_out(mockStation2)
    #     expect(subject.journey_list).to eq([{entry_station: mockStation, exit_station: mockStation2}])
    #   end
    # end
  end
end
