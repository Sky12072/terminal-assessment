# class Food
#   def initialize(protein)
#     @protein = protein
#   end
# end
# bacon = Food.new(21)


# class Food
#     def protein
#       @protein
#     end
#   end
 
#   p bacon.protein


#   class Food
#     def protein=(value)
#       @protein = value
#     end
#   end
# p bacon.protein=25

#---------------------------------
# class Food
#     attr_accessor :protein
#     def initialize(protein)
#       @protein = protein
#     end
#    end

# bacon = Food.new(21)
# p bacon.protein

#---------------------------------

class Date

    def self.show_date
        puts "print out current date"
    end

end

    class Date
        def self.show_date
            puts "print out meeting date"
        end
    end

    Date.show_date