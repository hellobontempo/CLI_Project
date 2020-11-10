

class RecipeList
    attr_accessor :label, :ingredient_list, :source, :url
    @@all = []
   
    def initialize (label, ingredient_list, source, url)
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

    def self.display_recipe(index)
        recipe = self.all[index]
        puts "#{recipe.label}"
        puts "Ingredients: #{recipe.ingredient_list}"
        puts "Source: #{source}"

        puts "Would you like to view this article in browser?"
        puts "1. Yes"
        puts "2. No"
    
        input = gets.chomp
        index = input.to_i - 1
    
        if index == 0
            system("open #{recipe.url}")
        end
        binding.pry
    end

end


