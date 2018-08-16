require_relative 'oystercard'
class Journey
PENALTY_FARE = 6
# move minimum fare to here
attr_reader :voyage

  def initialize(voyage)
    @voyage = {}
  end

  def start(station)
    @voyage.merge!(start: station)
  end

  def finish(station)
    @voyage.merge!(finish: station)
  end

  def complete?
    !(voyage[:start] == nil || voyage[:finish] == nil)
  end

  def fare
    self.complete? ? Oystercard::MINIMUM_FARE : PENALTY_FARE
  end
end
