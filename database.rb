oceania = [:Australia, :'New Zealand', :Vanuatu]
northamerica = [:US, :Mexico, :Canada, :'Puerto Rico', :'Bermuda', :'Virgin Island']   #winter December - March
europe = [:Russia, :Germany, :UK, :France, :Italy, :Ukraine, :Romania, :Netherlands, :Belgium, :Greece, :Portugal, :Hungary, :Belarus, :Austria, :Serbia, :Bulgaria, :Norway, :Croatia, :Moldova, :Albania, :Luxembourg, :Ireland] #winter December - March
asia = [:China, :'South Korea', :Japan, :'Hong Kong', :Macao]   #winter December - March
southeastasia = [:Cambodia, :Indonesia, :Malaysia, :Phillippines, :Singapore, :Thailand, :Vietnam]
middleeast = [:UAE, :Qatar, :Israel, :Turkey]              #winter December - March
southernafrica = [:'South Africa'] #winter june - september
northernafrica = [:Morocco]         #winter December - Feb


$data = {january: {winter: [northamerica, europe, asia, middleeast, northernafrica], summer: [oceania, southernafrica],tropicalcool: southeastasia}, 
    february: {winter: [northamerica, europe, asia, middleeast, northernafrica], summer: [oceania, southernafrica], tropicalcool: southeastasia},
    march: {autumn: [oceania, southernafrica], spring: [northamerica, europe, asia, middleeast, northernafrica], tropicalhot: southeastasia},
    april: {autumn: [oceania, southernafrica], spring: [northamerica, europe, asia, middleeast, northernafrica], tropicalhot: southeastasia},
    may: {autumn: [oceania, southernafrica], spring: [northamerica, europe, asia, middleeast, northernafrica], tropicalhot: southeastasia},
    june: {winter: [oceania, southernafrica], summer: [northamerica, europe, asia, middleeast, northernafrica], tropicalhot: southeastasia},
    july: {winter: [oceania, southernafrica], summer: [northamerica, europe, asia, middleeast, northernafrica], tropicalrainy: southeastasia },
    august: {winter: [oceania, southernafrica], summer: [northamerica, europe, asia, middleeast, northernafrica], tropicalrainy: southeastasia},
    september: {autumn: [northamerica, europe, asia, middleeast, northernafrica], spring: [oceania, southernafrica], tropicalrainy: southeastasia},
    october: {autumn: [northamerica, europe, asia, middleeast, northernafrica], spring: [oceania, southernafrica], tropicalrainy: southeastasia},
    november: {autumn: [northamerica, europe, asia, middleeast, northernafrica], spring: [oceania, southernafrica], tropicalrainy: southeastasia},
    december: {winter: [northamerica, europe, asia, middleeast, northernafrica], summer: [oceania, southernafrica], tropicalcool: southeastasia},
}





