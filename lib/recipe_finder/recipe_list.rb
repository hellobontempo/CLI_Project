

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

    # def self.display_recipes
    #     counter = 0
    #     self.all.each do |recipe|
    #         counter += 1
    #     puts "RECIPE (#{counter}/3): #{recipe.label.upcase}"
    #     puts "Ingredients: \n #{recipe.ingredient_list.join("\n")}"
    #     puts "This recipe is from #{recipe.source}"
    #     puts 
    #     puts "View this recipe in the browser?"
    #     puts "1. Yes, please!"
    #     puts "2. Nope - view the next recipe, please."
    #     puts "3. Start over"

    #         input = gets.chomp
    #         index = input.to_i - 1
            
    #         if index == 0
    #             system("open #{recipe.url}")
    #         elsif index == 3
    #             Cli.new.start
    #         else
    #             "Please enter a valid option."
    #         end
    #     end
    # end

end


