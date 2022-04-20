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
        if ARGV.empty? != true
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
    
    seasoncheck = false
    while seasoncheck != true
        puts ""
        $month = $prompt.select("which month would you travel in?".light_blue, %w(January February March April May June July August September October November December)) # filter 1
        $month = $month.downcase.to_sym
        
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
            end
        
        $season = $season.gsub(/\s+/, "")
        $season = $season.downcase.to_sym
        
        puts ""       
        
            
        seasoncheck = $data[$month].include?($season)            # returns true or false
        $dataresult = $data[$month][$season]            

        if seasoncheck == true
            $activity = $prompt.select("Do you like indoor or outdoor activity?".light_blue, %w(Indoor Outdoor)).light_blue # seperate additional results to add
            $activity.downcase!
            puts ""
            return
        end

        puts "==================================="
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

    if $activity == "outdoor"
        puts "Indoor activities ideas are:".light_green
        puts "Hiking"
        puts "Carnival"
        puts ""
    elsif $activity == "indoor"
        puts "Outdoor activities ideas are:".light_green
        puts "Fashion shopping"
        puts "Museums"
        puts ""
    end
end

def add_to_wishlist
    
    addprompt = $prompt.yes?("Would you like to add any of these countries to a wish list ?".light_blue)
        
    if addprompt == true
        storage = []
        while storage.empty? == true
            
            puts ""
            puts "Please select countries you want to add to the wishlist".light_blue
            countries_result = $data[$month][$season]
                  
            # store the selected countries
            storage = $prompt.multi_select("Select Countries".light_blue, countries_result)
            if storage.empty? == true
                puts ""
                puts "You have not selected any country. Please try again.".light_red
            end
            
        end
        # $wishlist << $storage
        $wishlist = $wishlist.push(storage)
        $wishlist.flatten!
        $wishlist = $wishlist.to_set
        $wishlist = $wishlist.to_a         
        
        $addmoreprompt = $prompt.yes?("Would you like to ADD MORE countries with different time and season?".light_blue)
        puts ""
            
            
    elsif addprompt != true 
            
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
    deletequestion = true
    while deletequestion != false 
        if deletequestion = $prompt.yes?("Would you like to remove any countries in your wishlist ?".light_blue)
            puts "==================================="
            puts "Countries in wishlist".light_green
            puts ""
            $wishlist.flatten!
            $wishlist = $wishlist.to_set
            $wishlist = $wishlist.to_a
            puts $wishlist
            puts "==================================="
            puts "Type in country to delete: ".light_blue
            deleteanswer = gets.chomp.to_sym
            emptywishlist = $wishlist.length
            # puts "wishlist array length is: #{emptywishlist}"
            
            exist = $wishlist.include?(deleteanswer)

            if emptywishlist != 1 && exist == true                  # IF deletequestion if TRUE, you have 3 options
                $wishlist.delete(deleteanswer)                  # which are the IF, Elsif and Elsif    
                puts ""
                puts "Your updated wishlist is: ".light_green
                puts "==================================="
                puts $wishlist
                # puts "wishlist array length is: #{emptywishlist}"
                puts "==================================="
                puts ""

        

            elsif exist == false
                puts "Invalid entry / Country does not exist in wishlist!".light_red
                puts ""

            elsif emptywishlist == 1 || $wishlist == 0
                puts "Your wishlist is empty.".light_green
                puts ""
                puts $wishlist
                # puts "wishlist array length is: #{emptywishlist}"
                puts ""
                return
            end

        elsif deletequestion == false                           # IF deletequestion is FALSE, abort
            puts ""
            puts "I see.. you don't want to delete any. Exiting now!".light_green
            puts ""
        # break
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
        puts $wishlist
        puts ""
        puts "==================================="
        puts ""

    else
        puts "==================================="
        puts ""
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
    # TTY::ProgressBar::Multi.new("main [:bar] :percent")
    pastel = Pastel.new
    green  = pastel.on_green(" ")
    red    = pastel.on_red(" ")
    bar = TTY::ProgressBar.new("Getting data [:bar] :percent", bar_format: :block, total: 30, complete: green)
    
    30.times do
        sleep(0.1)
        bar.advance  # by default increases by 1
    end
end



# So far so good but
# you still need to : add country without double name and ...
# if there are no countries in selected season, say countried don't exist
# need to edit finish with there no countries in your wishlist.
