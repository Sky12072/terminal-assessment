# require_relative './database'
# require "tty-prompt"
# require 'set'
# require "tty-progressbar"
# require "colorize"
# require "pastel"



$prompt = TTY::Prompt.new
# create global variable of country result so it can be accessed by different methods
# $countries_result = []
# $wishlist = []
# $month = ""
# $season = ""
# $activity = ""
# $wishlist = Set.new
$wishlist =[]
$dataresult =[]

def welcome
    puts "==================================="
    puts "Welcome to Travel Country Selector".yellow
    puts "==================================="
    $name = ""
    whitespaces = /\s/
    while $name.empty? == true 
        if ARGV.empty? != true                                      # Takes input either from command line or gets
            $name = ARGV[0]
        else
            puts "Enter your name: ".light_blue
            $name = gets.chomp
        end
        
        if $name.empty? == true 
            puts "Name can't be empty and letters only!".light_red
        else
            puts ""
            puts "Hi #{$name.green}, in order to assist you please select answer these questions:"
            puts ""
        end
    end
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

        if seasoncheck == true
            $activity = $prompt.select("Do you like indoor or outdoor activity?".light_blue, %w(Indoor Outdoor)).light_blue # seperate additional results to add
            $activity.downcase!
            puts ""
            return
        end                                         # if the country chosen exist in data, break the loop and go to next method
                                                    # if the country chosen does not exist in data, continue to next step which is print
        puts "==================================="  # no countries available go back to start of loop.
        puts ""
        puts "Sorry, there are no countries available in that season. Please try other options.".light_red
        puts ""
        puts "==================================="
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
                $wishlist = $wishlist.to_set                # parse from array to set to avoid double country names
                $wishlist = $wishlist.to_a                  # parse wishlist into array
            rescue TypeError
                puts "Wrong data type"
            rescue NameError
                puts "Wrong name"
            rescue SyntaxError
                puts "Wrong Syntax"
            end
            $addmoreprompt = $prompt.yes?("Would you like to ADD MORE countries with different time and season?".light_blue)
            puts ""
            

        elsif addprompt != true             # if user does not want to add countries, choose end or restart
                
            $restart_or_end = $prompt.select("choose 'restart' to start over or to finish choose 'end'.".light_blue, %w(Restart End))
            # and then create new method to continue the step to start over or end with finish msg and print wishlist result
            puts ""
        end

    
end


# def start_over  
#     puts "You have chosen to start over".light_green
#     puts ""
# end


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
                
                deleteanswer = gets.chomp.to_sym       # takes user input and convert to symbol, test if user type with lowercase too!
                    
                $emptywishlist = $wishlist.length       # search wishlist if empty or not, by length and store it to emptywishlist
                                                            # but remember, whatever stored in emptywishlist does not get modified when wishlist is modified!    
                    
                exist = $wishlist.include?(deleteanswer)            #search if user input(deletequestion) exist in the wishlist
                    
                    
            rescue NoMethodError
                puts "Method error"
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
            puts "I see.. you don't want to delete any. Exiting now!".light_green
            puts ""            
            
        end
    end
end


def finish
    # puts "wishlist is empty? : #{$wishlist.empty?}"
    finishprompt = $wishlist.empty?
    if finishprompt == false
        puts "==================================="
        puts "Here are countries of your wishlist: ".light_green
        puts ""
        $wishlist.flatten!
        $wishlist = $wishlist.to_set
        $wishlist = $wishlist.to_a
        
        # puts "wishlist array length is: #{$wishlist}"
        puts $wishlist
        puts ""
        puts "==================================="
        puts ""
        if $activity =="outdoor"
            puts "Outdoor activities ideas are:".light_green
            puts "Hiking"
            puts "Sightseeing"
            puts "Carnival"
            puts "Landmarks"
            puts "Events"
            puts ""
    
        elsif $activity = "indoor"
            puts "Indoor activities ideas are:".light_green
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
    bar = TTY::ProgressBar.new("Getting data [:bar] :percent", bar_format: :block, total: 30, complete: green)
    
    30.times do
        sleep(0.1)
        bar.advance  # by default increases by 1
    end
end




