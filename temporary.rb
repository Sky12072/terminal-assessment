Class Database
    attr_reader: :january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december
    def initialize
        @oceania = [:Australia, :'New Zealand', :Vanuatu]
        @northamerica = [:US, :Mexico, :Canada, :'Puerto Rico', :'Bermuda', :'Virgin Island']   #winter December - March
        @europe = [:Russia, :Germany, :UK, :France, :Italy, :Ukraine, :Romania, :Netherlands, :Belgium, :Greece, :Portugal, :Hungary, :Belarus, :Austria, :Serbia, :Bulgaria, :Norway, :Croatia, :Moldova, :Albania, :Luxembourg, :Ireland] #winter December - March
        @asia = [:China, :'South Korea', :Japan, :'Hong Kong', :Macao]   #winter December - March
        @southeastasia = [:Cambodia, :Indonesia, :Malaysia, :Phillippines, :Singapore, :Thailand, :Vietnam]
        @middleeast = [:UAE, :Qatar, :Israel, :Turkey]              #winter December - March
        @southernafrica = [:'South Africa'] #winter june - september
        @northernafrica = [:Morocco]         #winter December - Feb
        #reorder hash by months and countries

        @january = {winter: [northamerica, europe, asia, middleeast, northernafrica], summer: [oceania, southernafrica],tropicalcool: southeastasia}
        @february = {winter: [northamerica, europe, asia, middleeast, northernafrica], summer: [oceania, southernafrica], tropicalcool: southeastasia}
        @march = {autumn: [oceania, southernafrica], spring: [northamerica, europe, asia, middleeast, northernafrica], tropicalhot: southeastasia}
        @april = {winter: countries1, autumn: [oceania, southernafrica], spring: [northamerica, europe, asia, middleeast, northernafrica], tropicalhot: southeastasia}
        @may = {autumn: [oceania, southernafrica], spring: [northamerica, europe, asia, middleeast, northernafrica], tropicalhot: southeastasia}
        @june = {winter: [oceania, southernafrica], summer: [northamerica, europe, asia, middleeast, northernafrica], tropicalhot: southeastasia}
        @july = {winter: [oceania, southernafrica], summer: [northamerica, europe, asia, middleeast, northernafrica], autumn: countries3, tropicalrainy: southeastasia }
        @august = {winter: [oceania, southernafrica], summer: [northamerica, europe, asia, middleeast, northernafrica], tropicalrainy: southeastasia }
        @september = {autumn: [northamerica, europe, asia, middleeast, northernafrica], spring: [oceania, southernafrica], tropicalrainy: southeastasia}
        @october = {autumn: [northamerica, europe, asia, middleeast, northernafrica], spring: [oceania, southernafrica], tropicalrainy: southeastasia}
        @november = {autumn: [northamerica, europe, asia, middleeast, northernafrica], spring: [oceania, southernafrica], tropicalrainy: southeastasia}
        @december = {winter: [northamerica, europe, asia, middleeast, northernafrica], summer: [oceania, southernafrica], tropicalcool: southeastasia}
    end

    def display
        puts ""


end



puts "Enter month: "
month = gets.chomp.downcase.to_sym                     # I think the issue when calling the value of January summer value

puts "Enter season: "                            # is after 'gets', the january input have to be in hash object not strings object.
season = gets.chomp.downcase.to_sym             # But I can't find any source to change it. Some article mentioned
                                                # about using rails or json to change string to hash object.
puts "=============================="
puts "The countries of chosen month and seasons are: "
# hashone = hashone.select{|key,value| puts "#{value}"}
# inventory=inventory.select {|key, value| puts "item: #{key} Cost: $#{value}"}
puts data[month][season]






oceania = ["Australia", "New Zealand", "Vanuatu"]
northamerica = ["US", "Mexico", "Canada", "Puerto Rico", "Bermuda", "Virgin Island"]   #winter December - March
europe = ["Russia", "Germany", "UK", "France", "Italy", "Ukraine", "Romania", "Netherlands", "Belgium", "Greece", "Portugal", "Hungary", "Belarus", "Austria", ":Serbia", "Bulgaria", "Norway", "Croatia", "Moldova", "Albania", "Luxembourg", "Ireland"] #winter December - March
asia = ["China", "South Korea", "Japan", "Hong Kong", "Macao"]   #winter December - March
southeastasia = ["Cambodia", "Indonesia", "Malaysia", "Phillippines", "Singapore", "Thailand", "Vietnam"]
middleeast = ["UAE", "Qatar", "Israel", "Turkey"]              #winter December - March
southernafrica = ["South Africa"] #winter june - september
northernafrica = ["Morocco"]         #winter December - Feb
#reorder hash by months and countries