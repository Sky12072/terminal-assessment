require "tty-prompt"
require_relative "./methods"
require_relative './database'
require "artii"
require "tty-progressbar"
require "colorize"
require "pastel"

pastel = Pastel.new
green  = pastel.on_green(" ")
red    = pastel.on_red(" ")

prompt = TTY::Prompt.new

a = Artii::Base.new 
puts a.asciify('Travel Country Selector').colorize(:yellow)

begin
    
    greetings(nameinput)
    loop do
        
        questions
        progressbar
        output

        add_to_wishlist
        
        if $restart_or_end == "End"
            break   
        
        end
                
        if $addmoreprompt == false        
            delete
            break
        else
            puts "Let's do this!".light_green
        end           
    end 
    indoor_outdoor(indoor_outdoor_prompt)    
    goodbye

rescue Interrupt
    puts " - App terminated"
end