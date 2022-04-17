require_relative './database'
require "tty-prompt"

$prompt = TTY::Prompt.new
# create global variable of country result so it can be accessed by different methods
# $countries_result = []
# $wishlist = []
# $month = ""
# $season = ""
# $activity = ""
$wishlist = []
def welcome
    puts "==================================="
    puts "Welcome to Travel Country Selector"
    puts "==================================="
    puts "Enter your name: "
    name = gets.chomp
    puts "Hi #{name}, in order to assist you, please select answer these questions:"
end

def questions
    $month = $prompt.select("which month would you travel in?", %w(January February March April May June July August September October November December)) # filter 1
    $month = $month.downcase.to_sym
    $season = $prompt.select("Choose the seasons?", %w(Summer Winter Autumn Fall Tropicalcool Tropicalhot Tropicalrainy)) #filter2
    $season = $season.downcase.to_sym 
    $activity = $prompt.select("Do you like indoor or outdoor activity?", %w(Indoor Outdoor)) # seperate additional results to add
    $activity.downcase
end



def output
    puts "The countries of chosen month and seasons are: "
    puts $data[$month][$season]
    $dataresult = $data[$month][$season]
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
        
        $wishlist = $wishlist.push($storage)
        $answer2 = $prompt.yes?("Would you like to add more countries with different time and season?")
    else
        $restart_or_end = $prompt.select("choose 'restart' to start over or to finish choose 'end'.", %w(Restart End))
        # and then create new method to continue the step to start over or end with finish msg and print wishlist result
        
    end
end
# $wishlist = $wishlist.push($storage)
def start_over  
    puts "you have chosen to start over"
end


def delete
    deletequestion = $prompt.yes?("Would you like to remove any countries in your wishlist ?")
    if deletequestion == true && $wishlist != 0
        puts "Choose country to delete: "
        deleteanswer = []
        deleteanswer = $prompt.multi_select("Select Countries", $wishlist)
        p "your delete answer is: #{deleteanswer}"
        $wishlist = $wishlist.delete(deleteanswer)
        # puts "Your updated wishlist is: "
        # puts $wishlist
    end
        
end


def finish
    puts "you have chosen to end"
    
    puts "Here are countries of your wishlist: "
    puts $wishlist
    puts "Good luck and hope we have helped you with your trip planning"
    puts "Ciaoo!!"
end

