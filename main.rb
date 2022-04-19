require "tty-prompt"
require_relative "./welcome"
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

welcome
loop do
    questions
    progressbar
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