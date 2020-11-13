
class Cli
    @@input = []

    def start
        puts "                    Hey good lookin' - whatcha got cookin'?"   
        puts "  Give us three ingredients you want to use, we'll give you three recipes to peruse."         
        puts "                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" 
        self.search
        self.search_results
        #binding.pry
    end

    def search
        self.user_input 
        self.fetch_api
    end

    def search_results
        Recipe.display_recipe_search_results
        self.view_recipe_details
        self.menu
    end

    def user_input      
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
                puts "{ Make sure everything is spelled correctly! :) }"
                Cli.new.user_input
                api = Api.new(ingredient_input)
                api.create_recipe
            else
                puts "Yum! Check out these recipes:"
                puts 
                api.create_recipe
            end
    end

    def view_recipe_details
        sleep(1)
        puts
        puts "Select a recipe to view details"
        index = gets.strip.to_i - 1
        max_limit = Recipe.all.length - 1
            until index.between?(0,max_limit)
                puts "Sorry that is an invalid choice - did you pick a number from above?"
                index = gets.strip.to_i - 1
            end
        sleep(1)
        recipe_instance = Recipe.all[index]
        self.display_recipe_details(recipe_instance)
    end

    def display_recipe_details(recipe_instance)
        puts "#{recipe_instance.label.upcase}"
        puts "This recipe is from: #{recipe_instance.source}"
        puts 
        puts "Ingredients: \n#{recipe_instance.ingredients.join("\n")}"
        puts
        puts "              ~~~"
        puts "1. Open recipe in browser"
        puts "2. Save recipe"
        puts "3. Main menu, please!"
        puts "-------------------------------------------"
        input = gets.strip.to_i - 1
            until input.between?(0,3)
                puts "Sorry that is an invalid choice - did you pick a number from above?"
                input = gets.strip.to_i - 1
            end
                if input == 0
                    system("open #{recipe_instance.url}")
                elsif input == 1
                    Recipe.saved_recipes << recipe_instance
                    sleep(1)
                    puts "Recipe saved!"
                elsif input == 2
                    menu
                end
        sleep(1)
    end

    def view_saved_recipe_details
        sleep(1)
        puts
        puts "Select a saved recipe to view details"
        index = gets.strip.to_i - 1
        max_limit = Recipe.saved_recipes.length - 1
            until index.between?(0,max_limit)
                puts "Sorry that is an invalid choice - did you pick a number from above?"
                index = gets.strip.to_i - 1
            end
        sleep(1)
        saved_recipe = Recipe.saved_recipes[index]
        self.display_saved_recipe_details(saved_recipe)
    end

    def display_saved_recipe_details(saved_recipe)
        puts "#{saved_recipe.label.upcase}"
        puts "This recipe is from: #{saved_recipe.source}"
        puts 
        puts "Ingredients: \n#{saved_recipe.ingredients.join("\n")}"
        puts
        puts "              ~~~"
        puts "1. Open recipe in browser"
        puts "2. Main menu, please!"
        puts "-------------------------------------------"
        input = gets.strip.to_i - 1
            until input.between?(0,1)
                puts "Sorry that is an invalid choice - did you pick a number from above?"
                input = gets.strip.to_i - 1
            end
                if input == 0
                    system("open #{saved_recipe.url}")
                elsif input == 1
                    menu
                end
        sleep(1)
    end

    def menu
        puts "   ~~~"
        puts "MAIN MENU"
        puts "1. View saved recipes"
        puts "2. Go back to search results"
        puts "3. Search with three new ingredients, for three more recipes (adds to current recipe list)"
        puts "4. Exit"
        puts 
        user_input = gets.strip.to_i - 1
            until user_input.between?(0,3)
                puts "Sorry that is an invalid choice - did you pick a number from above?"
                user_input = gets.strip.to_i - 1
            end
                if user_input == 0
                    if Recipe.saved_recipes.empty?
                        puts "You don't have any saved recipes!"
                    else 
                        puts Recipe.display_saved_recipes
                        self.view_saved_recipe_details
                    end
                    sleep(1)
                    self.menu
                elsif user_input == 1
                    self.search_results
                elsif user_input == 2
                    @@input.clear
                    self.search
                    self.search_results
                elsif user_input == 3
                    puts "Bye, darlin'!"
                    exit
                end
            
    end
end