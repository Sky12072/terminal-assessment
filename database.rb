# That means I need to have 12 months variable and each month is a hash with season as key and countries as values
# two type of countries that have opposite weather

#winter in asia and europe and north america and middleeast are the same

Class Database

    def

oceania = [:Australia, :'New Zealand', :Vanuatu]
northamerica = [:US, :Mexico, :Canada, :'Puerto Rico', :'Bermuda', :'Virgin Island']   #winter December - March
europe = [:Russia, :Germany, :UK, :France, :Italy, :Ukraine, :Romania, :Netherlands, :Belgium, :Greece, :Portugal, :Hungary, :Belarus, :Austria, :Serbia, :Bulgaria, :Norway, :Croatia, :Moldova, :Albania, :Luxembourg, :Ireland] #winter December - March
asia = [:China, :'South Korea', :Japan, :'Hong Kong', :Macao]   #winter December - March
southeastasia = [:Cambodia, :Indonesia, :Malaysia, :Phillippines, :Singapore, :Thailand, :Vietnam]
middleeast = [:UAE, :Qatar, :Israel, :Turkey]              #winter December - March
southernafrica = [:'South Africa'] #winter june - september
northernafrica = [:Morocco]         #winter December - Feb
#reorder hash by months and countries

january = {winter: [northamerica, europe, asia, middleeast, northernafrica], summer: [oceania, southernafrica], tropicalhot:adsf, tropicalcool: southeastasia, tropicalrainy:}
february = {winter: [northamerica, europe, asia, middleeast, northernafrica], summer: [oceania, southernafrica], tropicalhot:adsf, tropicalcool: southeastasia, tropicalrainy:}
march = {autumn: [oceania, southernafrica], spring: [northamerica, europe, asia, middleeast, northernafrica], tropicalhot: southeastasia, tropicalcool:adf, tropicalrainy:}
april = {winter: countries1, summer:countries2, autumn: [oceania, southernafrica], spring: [northamerica, europe, asia, middleeast, northernafrica], tropicalhot: southeastasia, tropicalcool:adf, tropicalrainy: }
may = {winter: countries1, summer:countries2, autumn: [oceania, southernafrica], spring: [northamerica, europe, asia, middleeast, northernafrica], tropicalhot: southeastasia, tropicalcool:adf, tropicalrainy:}
june = {winter: [oceania, southernafrica], summer: [northamerica, europe, asia, middleeast, northernafrica], autumn: countries3, tropicalhot: southeastasia, tropicalcool:adf, tropicalrainy:}
july = {winter: [oceania, southernafrica], summer: [northamerica, europe, asia, middleeast, northernafrica], autumn: countries3, spring: countries4, tropicalhot:adsf, tropicalcool:adf, tropicalrainy: southeastasia }
august = {winter: [oceania, southernafrica], summer: [northamerica, europe, asia, middleeast, northernafrica], autumn: countries3, spring: countries4, tropicalhot:adsf, tropicalcool:adf, tropicalrainy: southeastasia }
september = {winter: countries1, summer:countries2, autumn: [northamerica, europe, asia, middleeast, northernafrica], spring: [oceania, southernafrica], tropicalhot:adsf, tropicalcool:adf, tropicalrainy: southeastasia}
october = {winter: countries1, summer:countries2, autumn: [northamerica, europe, asia, middleeast, northernafrica], spring: [oceania, southernafrica], tropicalhot:adsf, tropicalcool:adf, tropicalrainy: southeastasia}
november = {winter: countries1, summer:countries2, autumn: [northamerica, europe, asia, middleeast, northernafrica], spring: [oceania, southernafrica], tropicalhot:adsf, tropicalcool:adf, tropicalrainy: southeastasia}
december = {winter: [northamerica, europe, asia, middleeast, northernafrica], summer: [oceania, southernafrica], autumn: countries3, spring: countries4, tropicalhot:adsf, tropicalcool: southeastasia, tropicalrainy: }

puts january[:summer]