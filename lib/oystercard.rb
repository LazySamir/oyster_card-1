class Oystercard
DEFAULT_BALANCE = 10
MINUMUM_FARE = 1
attr_reader :balance, :limit, :entry_station

  def initialize (balance = DEFAULT_BALANCE)
    @balance = balance
    @limit = 90
    @entry_station = nil
  end

  def in_journey?
    entry_station != nil
  end

  def more_than_min?
    @balance > MINIMUM_FARE
  end

  def add_money(amount)
    raise "balance limit reached: #{limit}" if (balance + amount) > limit
    @balance += amount
  end

  def touch_in(station)
    raise "balance below minimum: #{Oystercard::MINUMUM_FARE}" if balance < Oystercard::MINUMUM_FARE
    @entry_station = station
  end

  def touch_out
    @entry_station = nil
    deduct_money(MINUMUM_FARE)
  end

private

  def deduct_money(amount)
    raise "Insufficient balance, #{balance} remaining" if (balance - amount) < 0
    @balance -= amount
  end

end
