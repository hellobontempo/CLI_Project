
class Cli

    def start
        puts "                    Hey good lookin' - whatcha got cookin'?"   
        puts "  Give us three ingredients you want to use, we'll give you three recipes to peruse."         
        puts "                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" 
        self.user_input 
        self.fetch_api
        Recipe.display_recipe_search_results
        self.menu
        #prompt to search again or view more recipes
        binding.pry
    end

    def user_input      
        @@input = []
        puts "Type 3 ingredients you would like to use. Hit 'enter' after each ingredient."
        puts 
        ing_1 = gets.strip  #gsub ingredients with a space, put in a +
        ing_2 = gets.strip
        ing_3 = gets.strip
        @@input << ing_1 << ing_2 << ing_3
    end 

    def ingredient_input
        @@input.sort
    end

    def fetch_api
        api = Api.new(ingredient_input) 
        if api.valid_ingredients? == false
            puts "Hmm, we couldn't find a recipe that matched. Let's try this again..."
            Cli.new.user_input
            api = Api.new(ingredient_input)
            api.create_recipe
        else
            puts "Yum! Check out these recipes:"
            sleep(1)
            api.create_recipe
        end
    end

    def menu
        puts "Choose a recipe to view details"
        index = gets.strip.to_i - 1
        max_limit = Recipe.all.length - 1
            until index.between?(0,max_limit)
                puts "Sorry that is an invalid choice"
                index = gets.strip.to_i - 1
            end
            recipe_instance = Recipe.all[index]
            # call the method that will print out the details
            Recipe.display_recipe_details(recipe_instance)
    end

end