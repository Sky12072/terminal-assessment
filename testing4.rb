# def ==(other)
#     self == other
# end

# p self


class Salad
    def initialize
      @ingredients = []
    end
    def add_nuts
      @ingredients << :nuts
      self
    end
  end
  my_salad = Salad.new.add_nuts
  p my_salad