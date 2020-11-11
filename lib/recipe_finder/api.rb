

class Api 
    attr_reader :ingredient_list

    #ing_1 = ingredient_list[0]

    def initialize(ingredient_list)
        @ingredient_list = ingredient_list
    end

    def fetch_recipes
        #new_list = RecipeList.new(ingredient_list)
        url = "https://api.edamam.com/search?q=#{ingredient_list[0]}%2C+#{ingredient_list[1]}%2C+#{ingredient_list[2]}&app_id=f6079da5&app_key=e49cae3161adbbdfa4b3dfc459efa240"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        recipes = JSON.parse(response)
        recipes["hits"][1..3]
        #recipes["hits"][1..3].each do |recipe|
        #new_recipe = Recipe.new(new_list)
        #end
    end

    def create_recipe
        self.fetch_recipes.collect {|hits| Recipe.new(hits["recipe"]["label"], hits["recipe"]["ingredientLines"], hits["recipe"]["source"], hits["recipe"]["url"])}
    end



end