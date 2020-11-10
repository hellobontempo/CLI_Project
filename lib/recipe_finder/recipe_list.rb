

class RecipeList
    attr_accessor :label, :ingredient_list, :source, :url
    @@all = []
   
    def initialize (label, ingredient_list, source, url)
        @label = label
        @ingredient_list = ingredient_list
        @source = source 
        @url = url
        @@all << self
    end

    def self.all
        @@all
    end

    def self.display_recipe
        counter = 0
        self.all.each do |recipe|
            counter += 1
        puts "Recipe #{counter}/3. 2#{recipe.label}"
        puts "Ingredients: \n #{recipe.ingredient_list.join("\n")}"
        puts "From: #{recipe.source}"
        puts 
        puts "Would you like to view this article in browser?"
        puts "1. Yes"
        puts "2. Nope - view the next recipe, please."
    
        input = gets.chomp
        index = input.to_i - 1
    
    
            if index == 0
                system("open #{recipe.url}")
            end
        end
    end

end


