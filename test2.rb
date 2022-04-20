# require 'set'
# wishlist = [:Australia, :"New Zealand", :Vanuatu], [:Australia, :"New Zealand", :Vanuatu, :"South Africa"]
# wishlist.flatten!
# wishlist = wishlist.to_set
# wishlist = wishlist.to_a

# puts wishlist

# a = "Tim Mogot"

# puts a.gsub(/\s+/, "")


begin
    puts "Enter your name: "
    $name = gets.chomp
    puts ""
    puts "Hi #{$name}, in order to assist you please select answer these questions:"
    puts $name.class
rescue $name = "" 
    puts "Name can't be empty"
    retry
end