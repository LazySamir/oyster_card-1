require './lib/oystercard.rb'
require './lib/station.rb'
require './lib/journey.rb'

card = Oystercard.new
card.touch_in("radio4")
card.touch_out("Bank")
card.touch_in("radio5")
card.touch_out("Banks")

card.journey_list


station = Station.new(name: 'hello', zone: 1)
station.zone
station.name

journey = Journey.new("voyage")
journey.start(station)
journey.finish(station)
journey.complete?
journey.fare
