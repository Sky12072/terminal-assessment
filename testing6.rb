
puts "Enter monthanswer:"
monthanswer = gets.chomp.downcase.to_sym
symbol = monthanswer.to_sym
p "monthanswer: #{monthanswer}"
p "class: #{monthanswer.class}"
p "=============="
p "monthanswer: #{symbol}"
p "class: #{symbol.class}"