class Oystercard
DEFAULT_BALANCE = 10
MINIMUM_FARE = 1
attr_reader :balance, :limit

  def initialize (balance = DEFAULT_BALANCE)
    @balance = balance
    @limit = 90
  end

  def touch_in(station, voyage)
    raise "balance below minimum: #{Oystercard::MINIMUM_FARE}" unless more_than_min?
    voyage.start(station)
  end

  def touch_out(station, voyage)
    voyage.finish(station)
    deduct_money(voyage.fare)
    voyage.clear_stations
  end

  def more_than_min?
    @balance > MINIMUM_FARE
  end

  def add_money(amount)
    raise "balance limit reached: #{limit}" if (balance + amount) > limit
    @balance += amount
  end

private

  def deduct_money(amount)
    raise "Insufficient balance, #{balance} remaining" if (balance - amount) < 0
    @balance -= amount
  end

end
