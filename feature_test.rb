require './lib/oystercard.rb'
require './lib/station.rb'
card = Oystercard.new
card.touch_in("radio4")
card.touch_out("Bank")
card.touch_in("radio5")
card.touch_out("Banks")

card.journey_list


station = Station.new('hello', 1)
station.zone
station.name
