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




def delete
    deletequestion = ""
    # if deletequestion == true
    while deletequestion != "n"
    # deletequestion = $prompt.yes?("Would you like to remove any countries in your wishlist ?")
    puts "Would you like to remove any countries in your wishlist ?"
    puts "Press (y)yes to procees, press '(n)no to abort"
    deletequestion = gets.chomp
    p "deletequestion class is: #{deletequestion.class}"
        if deletequestion != "n" && $wishlist != 0 && $wishlist.include?(deleteanswer)
        puts "Type in country to delete: "
        deleteanswer = gets.chomp.to_sym                # take the input
        puts "==================================="
        puts ""

        # if answer matched with wishlist
        $wishlist.delete(deleteanswer)
        puts "Your updated wishlist is: "
        puts "==================================="
        puts $wishlist
        puts "==================================="
               
        elsif deleteanswer == "n"
        puts "I see..,you don't want to delete any"
        break
    
        elsif $wishlist == 0
        puts "Your wishlist is empty."

        else
        puts "Invalid entry / Country does not exist in wishlist!"
        puts ""
        end
    end
end


welcome
loop do
    questions
    output  
    add_to_wishlist
    
    if $restart_or_end == "End"
        break       
    end
    
    if $answer2 == false
        delete
        break
    else
        start_over
    end
end 

finish
goodbye





welcome
loop do
    questions
    output  
    add_to_wishlist
    
    if $restart_or_end == "End"
        # if $wishlist != 0
        #     delete
        # end
        # finish
        break       
    end
    
    if $answer2 == false
        # if $wishlist != 0
        #     delete
        # end
        # finish
        delete
        break
    else
        start_over
    end
end 

# delete
finish
goodbye