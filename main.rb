require "tty-prompt"
require_relative "./welcome"
require_relative './database'
require "artii"

prompt = TTY::Prompt.new

a = Artii::Base.new 
puts a.asciify('Travel Country Selector')

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