# require 'set'
# wishlist = [:Australia, :"New Zealand", :Vanuatu], [:Australia, :"New Zealand", :Vanuatu, :"South Africa"]
# wishlist.flatten!
# wishlist = wishlist.to_set
# wishlist = wishlist.to_a

# puts wishlist

# a = "Tim Mogot"

# puts a.gsub(/\s+/, "")


# s =~ /\A\s*\Z/
# puts s


# x = ""
# if not (x =~ /\S/) then
#     puts "It's all whitespace!"
# end



array = [:Australia]
puts array
array.delete(:Australia)
puts array 

if array.empty? == true
    puts "array is empty"
    puts array
else
    puts "array is NOT empty"
    puts array
end
