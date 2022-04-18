require 'set'
wishlist = [:Australia, :"New Zealand", :Vanuatu], [:Australia, :"New Zealand", :Vanuatu, :"South Africa"]
wishlist.flatten!
wishlist = wishlist.to_set
wishlist = wishlist.to_a

puts wishlist