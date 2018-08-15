require './lib/oystercard.rb'
card = Oystercard.new
card.touch_in("radio4")
card.touch_out("Bank")
card.journey_list
