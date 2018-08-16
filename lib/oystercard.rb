class Oystercard
DEFAULT_BALANCE = 10
MINIMUM_FARE = 1
attr_reader :balance, :limit, :entry_station, :exit_station, :journey_list

  def initialize (balance = DEFAULT_BALANCE)
    @balance = balance
    @limit = 90
    @entry_station = nil
    @journey_list = []
    # @journey = {}
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
    raise "balance below minimum: #{Oystercard::MINIMUM_FARE}" if balance < Oystercard::MINIMUM_FARE
    @entry_station = station
  end

  def touch_out(station)
    @exit_station = station
    # journey < { entry_station: entry_station, exit_station: exit_station }
    @journey_list << { entry_station: entry_station, exit_station: exit_station }
    # journey[entry_station] = exit_station
    clear_stations
    deduct_money(MINIMUM_FARE)
  end

def clear_stations
  @entry_station = nil
  @exit_station = nil
end

private

  def deduct_money(amount)
    raise "Insufficient balance, #{balance} remaining" if (balance - amount) < 0
    @balance -= amount
  end

end
