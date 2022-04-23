require_relative './database'
require "tty-prompt"
require 'set'
require "tty-progressbar"
require "colorize"
require "pastel"



$prompt = TTY::Prompt.new

$wishlist =[]
$dataresult =[]

def nameinput
    puts "==================================="
    puts "Welcome to Travel Country Selector".yellow
    puts "==================================="
    $name = ""
    
    while $name.empty? == true 
        if ARGV.empty? != true && ARGV[0] != "-about"                                     # Takes input either from command line or gets
            $name = ARGV[0]
        elsif ARGV.empty? != true && ARGV[0] == "-about"    
            puts ""
            puts File.read('./about.txt')
            puts ""
            exit
        else
            puts "Enter your name: ".light_blue
            $name = gets.chomp
            
        end
        
        if $name.empty? == true 
            puts "Name can't be empty!".light_red
        else 
            return $name
        end
    end
end

def greetings(nameinput)
    puts ""
    puts "Hi #{nameinput}, in order to assist you please select answer these questions:"
    puts ""
    return nameinput
end

def questions
    
    seasoncheck = false                         # declare boolean variable
    while seasoncheck != true                   # as long as countries search is not available or false, keep looping
        puts ""
        $month = $prompt.select("which month would you travel in?".light_blue, %w(January February March April May June July August September October November December)) # filter 1
        $month = $month.downcase.to_sym             # $month contains chosen month
        
        puts ""
        $season = $prompt.select("Choose the season?".light_blue) do |menu| 
            menu.per_page 8
            menu.choice "Summer"
            menu.choice "Winter" 
            menu.choice "Autumn"
            menu.choice "Spring"
            menu.choice "Tropical Cool"
            menu.choice "Tropical Hot"
            menu.choice "Tropical Rainy"
            end                                     # this end is for prompt. don't delete
        
        $season = $season.gsub(/\s+/, "")           # removes whitespaces from tropicals
        $season = $season.downcase.to_sym           # convert to downcase and then to symbol
        
        puts ""       
        
        # seasoncheck is what decides the loop going or not    
        seasoncheck = $data[$month].include?($season)           # calling the month and season from data and then returns true or false
        $dataresult = $data[$month][$season]                    # calling the month and season from data and then returns the countries

        if seasoncheck != true                                      
                                                    
        puts "==================================="  
        puts ""
        puts "Sorry, there are no countries available in that season. Please try other options.".light_red
        puts ""
        puts "==================================="
        end
    end
end


def output
    puts ""
    puts "The countries of chosen month and season are: ".light_green
    puts $dataresult
    puts ""
end

def add_to_wishlist
    
        addprompt = $prompt.yes?("Would you like to add any of these countries to a wish list ?".light_blue)
            
        if addprompt == true                    #if user wants to add countries
            
            storage = []                        # declare storage variable as array
            while storage.empty? == true        # this loop will repeat if user selects nothing
                
                puts ""
                puts "Please select countries you want to add to the wishlist".light_blue
                countries_result = $data[$month][$season]
                    
                # store the selected countries to storage variable
                storage = $prompt.multi_select("Select Countries".light_blue, countries_result)
                if storage.empty? == true       # if the storage or if user select one countries, it will break the loop and continue on
                    puts ""
                    puts "You have not selected any country. Please try again.".light_red
                end
            end

            begin 
                # This is to prevent double names of country in storage if user selected twice of the same country name
                $wishlist = $wishlist.push(storage)         # add chosen countries to wishlist
                $wishlist.flatten!                          # combine multiple arrays into one array    
                $wishlist = $wishlist.to_set               # parse from array to set to avoid double country names
                $wishlist = $wishlist.to_a                  # parse wishlist into array
            rescue TypeError
                puts "Wrong data type - line 116 to 119"
            rescue NameError
                puts "Wrong name - line 116 to 119"
            rescue SyntaxError
                puts "Wrong Syntax - line 116 to 119"
            end

            $addmoreprompt = $prompt.yes?("Would you like to ADD MORE countries with different time and season?".light_blue) # variable is used in main.rb
            puts ""
            

        elsif addprompt != true             # if user does not want to add countries, choose end or restart
                
            $restart_or_end = $prompt.select("choose 'restart' to start over or to finish choose 'end'.".light_blue, %w(Restart End)) # variable is used in main.rb
            # This then create new method to continue the step to start over or end with finish msg and print wishlist result
            puts ""
        end

    
end



def delete
    
    deletequestion = true                       # declare boolean variable 'deletequestion'
    while deletequestion != false               # as long as deletequestion(user choose to delete) is true keep looping until it's false
            
        if deletequestion = $prompt.yes?("Would you like to remove any countries in your wishlist ?".light_blue)
            puts "==================================="
            puts "Countries in wishlist".light_green
            puts ""
            $wishlist.flatten!                  # combine multiple arrays into one array  
            $wishlist = $wishlist.to_set        # parse from array to set to avoid double country names
            $wishlist = $wishlist.to_a          # parse wishlist into array
                
            puts $wishlist
            puts "==================================="
            puts "Type in country to delete: (Case sensitive) ".light_blue
                
            begin 
                
                deleteanswer = gets.chomp.to_sym       # takes user input and convert to symbol, test if user type with lowercase too   
                    
                exist = $wishlist.include?(deleteanswer)            #search if user input(deletequestion) exist in the wishlist                    
                    
            rescue NoMethodError
                puts "Method error - line 163 to 165"
            rescue TypeError
                puts "Wrong data type - line 163 to 165"
            rescue NameError
                puts "Wrong name - line 163 to 165"
            rescue SyntaxError
                puts "Wrong Syntax - line 163 to 165"
            end

            if exist == true                  # IF deletequestion if TRUE, you have 2 options
                $wishlist.delete(deleteanswer)                  # which are the IF, Elsif     
                puts ""
                
                if $wishlist.empty? != true
                    puts "Your updated wishlist is: ".light_green
                    puts "==================================="          # if user input(deletequestion) exist in the wishlist, print wishlist
                                                                            # and keep looping to deletequestions (ask user again to delete)
                    puts $wishlist  
                    puts "==================================="
                    puts ""

                elsif $wishlist.empty? == true
                    puts "You have nothing else to delete! Please restart to try again.".light_red
                    break
                end
                
            

            elsif exist == false                    # if user input(deletequestion) does NOT exist in the wishlist, print error msg 
                puts "Invalid entry / Country does not exist in wishlist!".light_red    # loop back to deletequestion
                puts ""            
            end
            

        elsif deletequestion == false                           # IF deletequestion is FALSE, abort
            puts ""
            puts "The last bit!".light_green
            puts ""            
            
        end
    end
end

def indoor_outdoor
    if $wishlist.empty? != true
        $activity = $prompt.select("Do you like indoor or outdoor activity?".light_blue, %w(Indoor Outdoor)).light_blue # seperate additional results to add
        $activity.downcase!
        puts ""
    end
        
end


def finish
   
    finishprompt = $wishlist.empty?
    if finishprompt == false
        puts "==================================="
        puts "Here are countries of your wishlist: ".light_green
        puts ""
        $wishlist.flatten!
        $wishlist = $wishlist.to_set
        $wishlist = $wishlist.to_a
        
        
        puts $wishlist
        puts ""
        puts "==================================="
        puts ""
        puts "outdoor or indoor is: #{$activity}"
        if $activity == "outdoor"
            puts "Outdoor activity ideas are:".light_green
            puts "Hiking"
            puts "Sightseeing"
            puts "Carnival"
            puts "Landmarks"
            puts "Events"
            puts ""
    
        elsif $activity == "indoor"
            puts "Indoor activity ideas are:".light_green
            puts "Fashion shopping"
            puts "Restaurants"
            puts "Souvenir"
            puts "Bakery"
            puts "Nightlife"
            puts ""
        end

    else
        puts "==================================="
        puts ""
        
        # puts "wishlist array length is: #{$wishlist}"
        puts "Your wishlist is empty.".light_green    
        puts ""
        puts "==================================="
        puts ""
    end
    
end


def goodbye
    puts ""
    puts "Thank you, #{$name} for using our service.".yellow
    puts "Good luck with your future trip!".yellow
    puts ""
end


def progressbar
    
    pastel = Pastel.new
    green  = pastel.on_green(" ")
    red    = pastel.on_red(" ")
    bar = TTY::ProgressBar.new("Compiling [:bar] :percent", bar_format: :block, total: 30, complete: green)
    
    30.times do
        sleep(0.1)
        bar.advance  # by default increases by 1
    end
end




