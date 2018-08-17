require_relative 'oystercard'
class Journey
PENALTY_FARE = 6
# move minimum fare to here
attr_reader :voyage

  def initialize(voyage)
    @voyage = {}
  end
#private
  def start(station)
    @voyage.merge!(start: station)
  end

  def finish(station)
    @voyage.merge!(finish: station)
  end

  def fare
    self.complete? ? Oystercard::MINIMUM_FARE : PENALTY_FARE
  end

  def clear_stations
    @voyage = {start: nil, finish: nil}
  end

  # is in_journey? needed anymore?
  def in_journey?
    !(voyage[:start] == nil)
  end

  def complete?
    !(@voyage[:start] == nil || @voyage[:finish] == nil)
  end
end
