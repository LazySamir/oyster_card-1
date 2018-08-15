require './lib/oystercard.rb'
card = Oystercard.new
card.touch_in("radio4")
card.in_journey?
