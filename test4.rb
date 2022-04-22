require 'colorize'
                    # 0 1 2 3
comp_number = [1, 9, 4, 3]
input_number = [1, 8, 4, 5] 


comp_number.each_with_index do |item,index| 
  # comp_value = item
  # comp_index = index
# while false
# comp_number[item].include?(input_number[item]) != true

  if comp_number[item] == input_number[item] && comp_number[index] == input_number[index]
    puts input_number[index].to_s.green
  
  elsif comp_number[item] == input_number[item] && comp_number[index] != input_number[index]
    puts input_number[index].to_s.yellow
  else
    puts input_number[index].to_s.red
  end
  # print comp_value
  # print comp_index


end
# end