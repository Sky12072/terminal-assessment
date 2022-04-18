require_relative './database'
require "tty-prompt"
require 'set'

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
    puts "Welcome to Travel Country Selector"
    puts "==================================="
    puts "Enter your name: "
    $name = gets.chomp
    puts "Hi #{$name}, in order to assist you please select answer these questions:"
    puts ""
    puts "dataresult class is: #{$dataresult.class}"
end

def questions
    # puts "dataresult class is: #{$dataresult.class}"
    # puts "dataresult is empty? : #{$dataresult.empty?}"
    seasoncheck = false
    while seasoncheck != true
        puts ""
        $month = $prompt.select("which month would you travel in?", %w(January February March April May June July August September October November December)) # filter 1
        $month = $month.downcase.to_sym
        puts ""
        $season = $prompt.select("Choose the seasons?", %w(Summer Winter Autumn Spring Tropicalcool Tropicalhot Tropicalrainy)) #filter2
        $season = $season.downcase.to_sym 
        puts ""
        

            
        seasoncheck = $data[$month].include?($season)            # returns true or false
        
        $dataresult = $data[$month][$season]


        # puts "dataresult is empty? : #{$dataresult.empty?}"
        # puts "dataresult class is: #{$dataresult.class}"
        # puts "dataresult length is: #{$dataresult.length}"

            

        if seasoncheck == true
            
            $activity = $prompt.select("Do you like indoor or outdoor activity?", %w(Indoor Outdoor)) # seperate additional results to add
            $activity.downcase!
            
            puts ""
            return
        end
        puts "==================================="
        puts ""
        puts "Sorry, there are no countries available in that season. Please try other options."
        puts ""
        puts "==================================="
    end
end



def output
    puts ""
    puts "The countries of chosen month and seasons are: "
    puts $dataresult
    puts ""
    if $activity == "outdoor"
        puts "Indoor activities ideas are:"
        puts "Hiking"
        puts "Carnival"
        puts ""
    elsif $activity == "indoor"
        puts "Outdoor activities ideas are:"
        puts "Fasion shopping"
        puts "Museums"
        puts ""
    end
end

def add_to_wishlist
    answer1 = $prompt.yes?("Would you like to add any of these countries to a wish list ?")
    # p answer1.class
    # p answer1
    if answer1 == true 
        puts "Please select countries you want to add to the wishlist"
        countries_result = $data[$month][$season]
       
        # store the selected countries
        $storage = $prompt.multi_select("Select Countries", countries_result)
        # $wishlist << $storage
        $wishlist = $wishlist.push($storage)
        $wishlist.flatten!
        
        $answer2 = $prompt.yes?("Would you like to add more countries with different time and season?")
        puts ""
    else
        $restart_or_end = $prompt.select("choose 'restart' to start over or to finish choose 'end'.", %w(Restart End))
        # and then create new method to continue the step to start over or end with finish msg and print wishlist result
        puts ""
    end
end
# $wishlist = $wishlist.push($storage)
def start_over  
    puts "you have chosen to start over"
    puts ""
end


def delete
    deletequestion = true
    while deletequestion != false
        if deletequestion = $prompt.yes?("Would you like to remove any countries in your wishlist ?")
            puts "==================================="
            puts "Countries in wishlist"
            puts ""
            puts $wishlist
            puts "==================================="
            puts "Type in country to delete: "
            deleteanswer = gets.chomp.to_sym
            emptywishlist = $wishlist.length
            # puts "wishlist array length is: #{emptywishlist}"
            
            exist = $wishlist.include?(deleteanswer)

            if emptywishlist != 1 && exist == true                  # IF deletequestion if TRUE, you have 3 options
                $wishlist.delete(deleteanswer)                  # which are the IF, Elsif and Elsif    
                puts ""
                puts "Your updated wishlist is: "
                puts "==================================="
                puts $wishlist
                # puts "wishlist array length is: #{emptywishlist}"
                puts "==================================="
                puts ""

        

            elsif exist == false
                puts "Invalid entry / Country does not exist in wishlist!"
                puts ""

            elsif emptywishlist == 1
                puts "Your wishlist is empty."
                puts ""
                puts $wishlist
                # puts "wishlist array length is: #{emptywishlist}"
                puts ""
                return
            end

        elsif deletequestion == false                           # IF deletequestion is FALSE, abort
            puts ""
            puts "I see.. you don't want to delete any. Exiting now!"
            puts ""
        # break
        end
    
    end
end


def finish
    puts "wishlist is empty? : #{$wishlist.empty?}"
    finishprompt = $wishlist.empty?
    if finishprompt == false
        puts "==================================="
        puts "Here are countries of your wishlist: "
        puts ""
        $wishlist.flatten!
        $wishlist = $wishlist.to_set
        $wishlist = $wishlist.to_a
        puts $wishlist
        puts ""
        puts "==================================="
        puts ""

    else
        puts "==================================="
        puts ""
        puts "Your wishlist is empty."    
        puts ""
        puts "==================================="
        puts ""
    end
    
end

def goodbye
    puts ""
    puts "Thank you, #{$name} for using our service."
    puts "Good luck with your future trip!"
    puts ""
end






# So far so good but
# you still need to : add country without double name and ...
# if there are no countries in selected season, say countried don't exist
# need to edit finish with there no countries in your wishlist.
