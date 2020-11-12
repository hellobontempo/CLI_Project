
class Recipe
    attr_reader :label, :ingredients, :source, :url, :ingredient_input
    @@all = []
   
    def initialize (label, ingredients, source, url, ingredient_input)
        @label = label
        @ingredients = ingredients.sort
        @source = source 
        @url = url
        @ingredient_input = ingredient_input
        @@all << self
    end

    def self.all
        @@all
    end

    def self.display_recipe_search_results
        puts 
        self.all.each_with_index do |recipe, index|
            puts "#{index+1}. #{recipe.label} - #{recipe.source}"
        end
    end


    def self.display_recipe_details(recipe)
        # self.all.each_with_index do |recipe, index|
        # puts "RECIPE #{index+1}:"
        puts "#{recipe.label.upcase}"
        puts 
        puts "Ingredients: \n#{recipe.ingredients.join("\n")}"
        puts "This recipe is from: #{recipe.source}"
        puts "              ~~~"
        puts "1. View recipe in browser"
        puts "2. Save recipe"
        puts "-------------------------------------------"
        #end
        input = gets.strip.to_i - 1
            if input == 0
                system("open #{recipe.url}")
            elsif input == 1
                RecipeList.new(recipe)
            end
            # elsif input == 1
            #     system("open #{self.all[1].url}")
            # elsif input == 2
            #     system("open #{self.all[2].url}")
            #end
        
    end
        
            
end