# Try for array

oceania = ["Australia", "New Zealand", "Vanuatu"]

puts "oceania class is: #{oceania.class}"
puts oceania[0]

puts "Enter continent(type 'oceania'):"
answer = gets.chomp.downcase     
puts "Enter index position: "                
index = gets.chomp.to_i
puts "=============================="
puts "The countries of chosen month and seasons are: "
puts answer[index]





