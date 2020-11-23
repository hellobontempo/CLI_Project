class Cli
  attr_accessor :ingredient_input

  def start
    puts "\n\n\n                      Hey good lookin' - whatcha got cookin'?"
    puts "Trying to decide? Pick three things you want to cook with and we'll find some recipes for you."
    puts "                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    sleep(2)
    self.search
  end

  def search
    self.user_input
    self.fetch_api
    self.search_results
  end

  def user_input
    @input = []
    puts "\n\nType 3 ingredients. Hit 'enter' after each ingredient.\n\n"
    puts "* Recipes may not include ALL of the ingredients you pick, but we'll do our best.\n\n"
    puts "Ingredient 1:"
    ing_1 = gets.strip
    sleep(1)
    puts "Ingredient 2:"
    ing_2 = gets.strip
    sleep(1)
    puts "Ingredient 3:\n"
    ing_3 = gets.strip
    sleep(1)
    @input << ing_1 << ing_2 << ing_3
  end

  def ingredient_input
    @input.sort
  end

  def fetch_api
    api = Api.new(ingredient_input)
    while api.valid_ingredients? == false
      sleep(1)
      puts "\n\n\n Hmm...there was an error in processing your request. Let's try this again...\n"
      puts "Make sure everything is spelled correctly! :)\n"
      @input.clear
      sleep(1)
      Cli.new.search
      api = Api.new(ingredient_input)
    end
    api.create_recipe
    puts "\n\n Yum! Check out these recipes:"
    puts "            ~~~     "
  end

  def search_results
    puts "\n\n SEARCH RESULTS:"
    Recipe.display_recipe_search_results
    self.view_recipe_details
    self.menu
  end

  def view_recipe_details
    sleep(1)
    puts
    puts "Enter a number to select a recipe to view."
    index = gets.strip.to_i - 1
    max_limit = Recipe.all.length - 1
    until index.between?(0, max_limit)
      puts "Sorry - invalid input. Did you pick a number from above?"
      index = gets.strip.to_i - 1
    end
    sleep(1)
    recipe_instance = Recipe.all[index]
    self.display_recipe_details(recipe_instance)
  end

  def display_recipe_details(recipe_instance)
    puts "\n\n#{recipe_instance.label.upcase}"
    puts "This recipe is from: #{recipe_instance.source}\n\n"
    puts "Ingredients: \n#{recipe_instance.ingredients.join("\n")}\n\n"
    puts "              ~~~"
    puts "1. Open recipe in browser"
    puts "2. Save recipe"
    puts "3. Main menu, please!"
    puts "-------------------------------------------"
    input = gets.strip.to_i - 1
    until input.between?(0, 2)
      puts 'Sorry - invalid input. Did you pick a number from above?'
      input = gets.strip.to_i - 1
    end
    if input == 0
      system("open #{recipe_instance.url}")
    elsif input == 1
      if Recipe.saved_recipes.include?(recipe_instance) == true
        puts "You already saved this one!"
      elsif Recipe.saved_recipes << recipe_instance
        sleep(1)
        puts "Recipe saved!"
      end
    elsif input == 2
      menu
    end
    sleep(1)
  end

  def view_saved_recipe_details
    sleep(1)
    puts "\n\n Enter a number to view a saved recipe \n"
    index = gets.strip.to_i - 1
    max_limit = Recipe.saved_recipes.length - 1
    until index.between?(0, max_limit)
      puts "Sorry - invalid input. Did you pick a number from above?"
      index = gets.strip.to_i - 1
    end
    sleep(1)
    saved_recipe = Recipe.saved_recipes[index]
    self.display_saved_recipe_details(saved_recipe)
  end

  def display_saved_recipe_details(saved_recipe)
    puts "#{saved_recipe.label.upcase}"
    puts "This recipe is from: #{saved_recipe.source}\n\n"
    puts "Ingredients: \n#{saved_recipe.ingredients.join("\n")}\n\n"
    puts "              ~~~"
    puts "1. Open recipe in browser"
    puts "2. Main menu, please!"
    puts "-------------------------------------------"
    input = gets.strip.to_i - 1
    until input.between?(0, 1)
      puts "Sorry - invalid input. Did you pick a number from above?"
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
    puts "3. ADD to recipe list and search with three new ingredients"
    puts "4. Exit\n"
    user_input = gets.strip.to_i - 1
    until user_input.between?(0, 3)
      puts "Sorry - invalid input. Did you pick a number from above?"
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
      @input.clear
      self.search
      self.search_results
    elsif user_input == 3
      sleep(1)
      puts "Time to get cookin? \n Bye, darlin'!"
      exit
    end
  end
end
