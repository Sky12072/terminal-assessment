require "tty-prompt"

prompt = TTY::Prompt.new
# That means I need to have 12 months variable and each month is a hash with season as key and countries as values
# two type of countries that have opposite weather

#winter in asia and europe and north america and middleeast are the same
oceania = [:Australia, :'New Zealand', :Vanuatu]
northamerica = [:US, :Mexico, :Canada, :'Puerto Rico', :'Bermuda', :'Virgin Island']   #winter December - March
europe = [:Russia, :Germany, :UK, :France, :Italy, :Ukraine, :Romania, :Netherlands, :Belgium, :Greece, :Portugal, :Hungary, :Belarus, :Austria, :Serbia, :Bulgaria, :Norway, :Croatia, :Moldova, :Albania, :Luxembourg, :Ireland] #winter December - March
asia = [:China, :'South Korea', :Japan, :'Hong Kong', :Macao]   #winter December - March
southeastasia = [:Cambodia, :Indonesia, :Malaysia, :Phillippines, :Singapore, :Thailand, :Vietnam]
middleeast = [:UAE, :Qatar, :Israel, :Turkey]              #winter December - March
southernafrica = [:'South Africa'] #winter june - september
northernafrica = [:Morocco]         #winter December - Feb
#reorder hash by months and countries

january = {winter: [northamerica, europe, asia, middleeast, northernafrica], summer: [oceania, southernafrica], tropicalhot: "adsf", tropicalcool: southeastasia, tropicalrainy: "adf"}
february = {winter: [northamerica, europe, asia, middleeast, northernafrica], summer: [oceania, southernafrica], tropicalhot: "adsf", tropicalcool: southeastasia, tropicalrainy: "adf"}
march = {autumn: [oceania, southernafrica], spring: [northamerica, europe, asia, middleeast, northernafrica], tropicalhot: southeastasia, tropicalcool:"adsf", tropicalrainy: "adsf"}
april = {winter: "countries1", summer:"countries2", autumn: [oceania, southernafrica], spring: [northamerica, europe, asia, middleeast, northernafrica], tropicalhot: southeastasia, tropicalcool:"adf", tropicalrainy:"adsf"}
may = {winter: "countries1", summer:"countries2", autumn: [oceania, southernafrica], spring: [northamerica, europe, asia, middleeast, northernafrica], tropicalhot: southeastasia, tropicalcool:"adsf", tropicalrainy:"adsf"}
june = {winter: [oceania, southernafrica], summer: [northamerica, europe, asia, middleeast, northernafrica], autumn: "countries3", tropicalhot: southeastasia, tropicalcool:"adsf", tropicalrainy:"adsf"}
july = {winter: [oceania, southernafrica], summer: [northamerica, europe, asia, middleeast, northernafrica], autumn: "countries3", spring: "countries4", tropicalhot:"adsf", tropicalcool:"adsf", tropicalrainy: southeastasia }
august = {winter: [oceania, southernafrica], summer: [northamerica, europe, asia, middleeast, northernafrica], autumn: "countries3", spring: "countries4", tropicalhot:"adsf", tropicalcool:"adsf", tropicalrainy: southeastasia }
september = {winter: "countries1", summer:"countries2", autumn: [northamerica, europe, asia, middleeast, northernafrica], spring: [oceania, southernafrica], tropicalhot:"adsf", tropicalcool:"adsf", tropicalrainy: southeastasia}
october = {winter: "countries1", summer:"countries2", autumn: [northamerica, europe, asia, middleeast, northernafrica], spring: [oceania, southernafrica], tropicalhot:"adsf", tropicalcool:"adsf", tropicalrainy: southeastasia}
november = {winter: "countries1", summer:"countries2", autumn: [northamerica, europe, asia, middleeast, northernafrica], spring: [oceania, southernafrica], tropicalhot:"adsf", tropicalcool:"adsf", tropicalrainy: southeastasia}
december = {winter: [northamerica, europe, asia, middleeast, northernafrica], summer: [oceania, southernafrica], autumn: "countries3", spring: "countries4", tropicalhot:"adsf", tropicalcool: southeastasia, tropicalrainy: "adsf"}

puts january[:summer]
puts january.class

puts "Welcome to Travel Country Selector"
puts "Enter your name: "
name = gets.chomp
puts "Hi #{name}, please select an answer of these questions:"


month = Hash.new
month = gets.chomp.downcase

season = gets.chomp
p "monthclass: #{month.class}"

seasonanswer = season.downcase.to_sym

answer = month[seasonanswer]

puts "=============================="
puts "The countries of chosen month and seasons are: "
puts ""
puts answer