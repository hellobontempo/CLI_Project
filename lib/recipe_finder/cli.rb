
class Cli

    def start
        puts "                    Hey good lookin' - whatcha got cookin'?"   
        puts "  Give us three ingredients you want to use, we'll give you three recipes to peruse."         
        puts "                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" 
        self.search
        # self.user_input 
        # self.fetch_api
        # Recipe.display_recipe_search_results
        # self.view_recipe_details
        binding.pry
    end

    def search
        self.user_input 
        self.fetch_api
        Recipe.display_recipe_search_results
        self.view_recipe_details
        menu
    end

    def user_input      
        @@input = []
        puts "Type 3 ingredients you would like to use. Hit 'enter' after each ingredient."
        puts "* Recipes may not include ALL of the ingredients you pick, but we'll do our best."
        ing_1 = gets.strip
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
                puts "Hmm, we couldn't find a recipe with those ingredients. Let's try this again..."
                puts "(Make sure everything is spelled correctly! :)"
                Cli.new.user_input
                api = Api.new(ingredient_input)
                api.create_recipe
            else
                puts "Yum! Check out these recipes:"
                sleep(1)
                api.create_recipe
            end
    end

    def view_recipe_details
        sleep(2)
        puts
        puts "Select a recipe to view details"
        index = gets.strip.to_i - 1
        max_limit = Recipe.all.length - 1
            until index.between?(0,max_limit)
                puts "Sorry that is an invalid choice - did you pick a number from above?"
                index = gets.strip.to_i - 1
            end
            recipe_instance = Recipe.all[index]
            # call the method that will print out the details
            Recipe.display_recipe_details(recipe_instance)
    end

    def menu
        puts "MAIN MENU"
        puts "1. View saved recipes"
        puts "2. Start a new search"
        puts 
        puts "Time to get cookin'? Type 'E' to exit!"
        user_input = gets.strip.to_i - 1
        if user_input == 0
            if RecipeList.all.empty? 
                puts "You don't have any saved recipes!"
            elsif RecipeList.all.length > 0
                RecipeList.all
            end
        elsif user_input == 1
            self.search
        # else
        #     puts "See ya later, darlin'"
        end
    end
end