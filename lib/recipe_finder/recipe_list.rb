

class Recipe
    attr_accessor :label, :time, :ingredient_list, :source, :url
    @@all = []
   
    def initialize (label, time, ingredient_list, source, url)
        @label = label
        @time = time
        @ingredient_list = ingredient_list
        @source = source 
        @url = url
        @@all << self
    end

    def self.all
        @@all
    end


end


