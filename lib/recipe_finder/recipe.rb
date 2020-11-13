
class Recipe
    attr_accessor :label, :ingredients, :source, :url, :ingredient_input
    @@all = []
    @@saved_recipes = []

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
        self.all.each_with_index do |recipe, index|
            puts "#{index+1}. #{recipe.label} - #{recipe.source}"
        end
    end


    def self.display_recipe_details(recipe)
        puts "#{recipe.label.upcase}"
        puts "This recipe is from: #{recipe.source}"
        puts 
        puts "Ingredients: \n#{recipe.ingredients.join("\n")}"
        puts
        puts "              ~~~"
        puts "1. View recipe in browser"
        puts "2. Save recipe"
        puts "3. Main menu, please!"
        puts "-------------------------------------------"
        input = gets.strip.to_i - 1
            until input.between?(0,3)
                puts "Sorry that is an invalid choice - did you pick a number from above?"
                input = gets.strip.to_i - 1
            end
                if input == 0
                    system("open #{recipe.url}")
                elsif input == 1
                    @@saved_recipes << recipe
                    sleep(1)
                    puts "Recipe saved!"
                end
        sleep(1)
    end


    def self.saved_recipes
        @@saved_recipes
    end

    def self.display_saved_recipes
        self.saved_recipes.each_with_index do |recipe, index|
            puts "#{index+1}. #{recipe.label} - #{recipe.source}"
        end
    end
        
            
end