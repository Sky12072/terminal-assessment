oceania = [:Australia, :'New Zealand', :Vanuatu]
january = {summer: oceania, tropicalhot: "adsf", tropicalrainy: "adf"}

puts january[:summer]

puts "Enter month(type 'January'):"
month = gets.chomp.downcase                     # I think the issue when calling the value of January summer value
puts "Enter season (type 'summer'):"                            # is after 'gets', the january input have to be in hash object not strings object.
season = gets.chomp.downcase.to_sym             # But I can't find any source to change it. Some article mentioned
                                                # about using rails or json to change string to hash object.
puts "=============================="
puts "The countries of chosen month and seasons are: "
puts month[season]