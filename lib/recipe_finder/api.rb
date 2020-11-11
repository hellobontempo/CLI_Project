

class Api 
    attr_reader :ing_1, :ing_2, :ing_3

    def initialize(ing_1, ing_2, ing_3)
        @ing_1 = ing_1 
        @ing_2 = ing_2
        @ing_3 = ing_3
    end

    def fetch_recipes
        url = "https://api.edamam.com/search?q=#{ing_1}%2C+#{ing_2}%2C+#{ing_3}&app_id=f6079da5&app_key=e49cae3161adbbdfa4b3dfc459efa240"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        recipes = JSON.parse(response)
        recipes["hits"][1..3]
    end

    def create_recipe_list
        self.fetch_recipes.each {|hits| RecipeList.new(hits["recipe"]["label"], hits["recipe"]["ingredientLines"], hits["recipe"]["source"], hits["recipe"]["url"])}
    end

end