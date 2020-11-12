
class Api 
    attr_reader :ingredient_input

    def initialize(ingredient_input)
        @ingredient_input = ingredient_input
    end

    def fetch_recipes
        url = "https://api.edamam.com/search?q=#{ingredient_input[0]}%2C+#{ingredient_input[1]}%2C+#{ingredient_input[2]}&app_id=f6079da5&app_key=e49cae3161adbbdfa4b3dfc459efa240"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        recipes = JSON.parse(response)
        recipes["hits"][1..3]
    end

    def valid_ingredients?
        if self.fetch_recipes == nil
            false
        elsif self.fetch_recipes.empty?
            false
        else
            true
        end
    end

    def create_recipe
        self.fetch_recipes.each {|hits| Recipe.new(hits["recipe"]["label"], hits["recipe"]["ingredientLines"], hits["recipe"]["source"], hits["recipe"]["url"], self.ingredient_input)}
    end

    # def create_recipe_list
    #     #new_list = Recipe.new(ingredient_list)
    #     #recipes["hits"][1..3].each do |recipe|
    #     #new_recipe = Recipe.new(new_list)
    #     #end
    #     new_list = Recipe.new(ingredient_list)
    #     self.fetch_recipes.each do |hits| 
    #         RecipeList.new(ingredient_list)}
    # end

   


end