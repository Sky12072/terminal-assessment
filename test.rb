oceania = [:Australia, :'New Zealand', :Vanuatu]
northamerica = [:US, :Mexico, :Canada, :'Puerto Rico', :'Bermuda', :'Virgin Island']   #winter December - March
europe = [:Russia, :Germany, :UK, :France, :Italy, :Ukraine, :Romania, :Netherlands, :Belgium, :Greece, :Portugal, :Hungary, :Belarus, :Austria, :Serbia, :Bulgaria, :Norway, :Croatia, :Moldova, :Albania, :Luxembourg, :Ireland] #winter December - March
asia = [:China, :'South Korea', :Japan, :'Hong Kong', :Macao]   #winter December - March
southeastasia = [:Cambodia, :Indonesia, :Malaysia, :Phillippines, :Singapore, :Thailand, :Vietnam]
middleeast = [:UAE, :Qatar, :Israel, :Turkey]              #winter December - March
southernafrica = [:'South Africa'] #winter june - september
northernafrica = [:Morocco]         #winter December - Feb
#reorder hash by months and countries
data = {january: {winter: [northamerica, europe, asia, middleeast, northernafrica], summer: [oceania, southernafrica],tropicalcool: southeastasia}}


# p oceania.include?(:Australia)
test = data[:january]
# p test
p data[:january].include?(:autumn)



# if oceania.include?(:SBY)
#     p "TRUE"
# else
#     p "FALSE"
# end

# p oceania = oceania.delete(:Australia)
# p oceania