
class Cli

    def start
        puts "                    Hey good lookin' - whatcha got cookin'?"   
        puts "  Give us three ingredients you want to use, we'll give you three recipes to peruse."         
        puts "                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" 
        self.user_input 
        self.fetch_api
        Recipe.display_all_recipes
        #prompt to search again or view more recipes
        binding.pry
        ``
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

    def ingredient_list
        @@input.sort
    end

    def fetch_api
        api = Api.new(ingredient_list) 
        if api.valid_ingredients? == false
            puts "Hmm, we couldn't find a recipe that matched. Let's try this again..."
            Cli.new.user_input
            api = Api.new(ingredient_list)
            api.create_recipe
        else
            puts "Yum! Check out these recipes:"
            sleep(1)
            api.create_recipe
        end
    end

    # def display_recipes
    #     Recipe.all.each_with_index do |recipe, index|
    #     puts "RECIPE (#{index+1}/3): #{recipe.label.upcase}"
    #     puts "Ingredients: \n #{recipe.ingredients.join("\n")}"
    #     puts "            ~~~"
    #     puts "This recipe is from: #{recipe.source}"
    #     puts 
    #     puts "Enter '1' to view recipe in browser."
    #     puts "Press any key to view next recipe."
    #         index = gets.strip.to_i - 1
            
    #         if index == 0
    #             system("open #{recipe.url}")
    #         end
    #     # puts "Enter '2' to save recipe." #when i feel like getting complicated
    #     #     index = gets.strip.to_i - 1
    #     #     if index == 1
    #     #         RecipeList
    #     #     end
    #     end
    #     puts "End of recipe list. Enter '1' to search with new ingredients."
    #         index = gets.strip.to_i - 1
    #         if index == 0
    #             #take it from the top
    #         end
    # end


end