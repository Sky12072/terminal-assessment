oceania = [:Australia, :'New Zealand', :Vanuatu]
january = {summer: oceania, tropicalhot: "adsf", tropicalrainy: "adf"}


puts "Enter month:"
month = gets.chomp.downcase
puts "Enter season:"
season = gets.chomp.downcase.to_sym

puts "=============================="
puts "The countries of chosen month and seasons are: "
puts month[season]