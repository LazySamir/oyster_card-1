require 'oystercard'

describe Oystercard do
let(:mockStation)   { double :station }

  describe ".new" do

    it "has a balance of 10" do
      expect(subject.balance).to eq(Oystercard::DEFAULT_BALANCE)
    end

    it "has a changeable default balance" do
      expect(Oystercard.new(5).balance).to eq(5)
    end
  end

  describe "#add_money" do
    it "tops up the card" do
      expect { subject.add_money(10) }.to change { subject.balance }.by +10
    end
    it "will not top up over .limit" do
      expect { subject.add_money(subject.limit+1) }.to raise_error("balance limit reached: #{subject.limit}")
    end
  end

  describe "#deduct_money" do
    it "touch_out reduces balance by minimum fare via #deduct_money" do
      subject.touch_out
      expect(subject.balance).to eq (Oystercard::DEFAULT_BALANCE - Oystercard::MINUMUM_FARE)
      # should this be in deduct_money or touch_out?
      # wants us to use this syntax
      # expect { subject.balance }.to change{}.by()
    end
  end

  describe "#in_journey?" do
    it "returns false by default" do
      expect(subject.in_journey?).to eq false
    end
  end

  describe "#touch_in" do
    it "assigns in_journey to true" do
      subject.touch_in(mockStation)
      expect(subject.in_journey?).to eq true
    end

    describe ".entry_station" do
      it "return last station name" do
        subject.touch_in(mockStation)
        expect(subject.entry_station).to eq mockStation
      end
    end

    context "while balance = 0" do
      let(:sub2)        { Oystercard.new(0) }
      it "raises error if not enough funds" do
        expect { sub2.touch_in(mockStation) }.to raise_error "balance below minimum: #{Oystercard::MINUMUM_FARE}"
      end
    end
  end

  describe "#touch_out" do
    it "assigns in_journey to false" do
      subject.touch_in(mockStation)
      #is this too relient on touch_in working? set instance variable directly?
      subject.touch_out
      expect(subject.in_journey?).to eq false
    end
    describe ".entry_station" do
      it "return nil" do
        subject.touch_out
        expect(subject.entry_station).to eq nil
      end
    end
  end
end
