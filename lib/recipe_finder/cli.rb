
class Cli
    @@input = []

    def start
        puts "             Hey good lookin' - whatcha got cookin'?"   
        puts "  But really, what's in your fridge? I'll help you find a recipe!"         
        puts "              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"       
        puts "Type 3 ingredients you would like to use. Hit 'enter' after each ingredient."
        self.user_ingredients
        api = Api.new(Cli.input[0], Cli.input[1], Cli.input[2])
        binding.pry
    end

    def user_ingredients #how to handle user data entered in differently, make a method 
        ing_1 = gets.chomp 
        ing_2 = gets.chomp
        ing_3 = gets.chomp
        @@input << ing_1 << ing_2 << ing_3
    end 

    def self.input
        @@input.sort
    end

    def self.display_recipes
        RecipeList.display_recipes
    end
 

end