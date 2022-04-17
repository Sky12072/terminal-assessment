require "tty-prompt"
require_relative "./welcome"
require_relative './database'

prompt = TTY::Prompt.new

welcome
loop do
    questions
    output  
    add_to_wishlist
    
    if $restart_or_end == "End"
        # if $wishlist != 0
        #     delete
        # end
        finish
        break       
    end
    
    if $answer2 == false
        # if $wishlist != 0
        #     delete
        # end
        finish
        break
    else
        start_over
    end
    
   
end 

delete