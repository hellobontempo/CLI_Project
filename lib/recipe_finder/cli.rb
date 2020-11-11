
class Cli

    def start
        puts "             Hey good lookin' - whatcha got cookin'?"   
        sleep(2)  
        puts "  But really, what's in your fridge? I'll help you find a recipe!"         
        puts "              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" 
        self.user_input
        api = Api.new(sort[0], sort[1], sort[2])
        api.create_recipe_list
        self.display_recipes
        #prompt to restart?
        binding.pry
    end

    def user_input      
        @@input = []
        puts "Type 3 ingredients you would like to use. Hit 'enter' after each ingredient."
        puts "If you make up ingredients, we'll try and read your mind :)"
        ing_1 = gets.strip  #gsub ingredients with a space, put in a +
        ing_2 = gets.strip
        ing_3 = gets.strip
        @@input << ing_1 << ing_2 << ing_3
    end 

    def sort
        @@input.sort
    end

    def display_recipes
        RecipeList.all.each_with_index do |recipe, index|
        puts "RECIPE (#{index+1}/3): #{recipe.label.upcase}"
        puts "Ingredients: \n #{recipe.ingredient_list.join("\n")}"
        puts "            ~~~"
        puts "This recipe is from #{recipe.source}"
        puts 
        puts "View this recipe in the browser?"
        puts "1. Yes, please!"
        puts "Press any key to view next recipe."

            index = gets.strip.to_i - 1
            
            if index == 0
                system("open #{recipe.url}")
            # elsif index == 2
            end
        puts 
        end
    end


end