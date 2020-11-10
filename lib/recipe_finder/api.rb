

class Api 
    attr_reader :query_1, :query_2, :query_3

    def initialize(query_1, query_2, query_3)
        @query_1 = query_1
        @query_2 = query_2
        @query_3 = query_3
    end

    def fetch_recipes
        url = "https://api.edamam.com/search?q=#{query_1}%2C+#{query_1}%2C+#{query_3}&app_id=f6079da5&app_key=e49cae3161adbbdfa4b3dfc459efa240"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        recipes = JSON.parse(response)
        recipes["hits"][1..3]
    end

    def create_recipes 
        self.fetch_recipes.each {|hits| RecipeList.new(hits["recipe"]["label"], hits["recipe"]["ingredientLines"], hits["recipe"]["source"], hits["recipe"]["url"])}
    end

end