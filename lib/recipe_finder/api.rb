class Api
  attr_accessor :ingredient_input

  def initialize(ingredient_input)
    @ingredient_input = ingredient_input
    url = "https://api.edamam.com/search?q=#{ingredient_input[0]}%2C+#{ingredient_input[1]}%2C+#{ingredient_input[2]}&app_id=#{ENV["API_ID"]}&app_key=#{ENV["API_KEY"]}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    recipes = JSON.parse(response)
    @recipe_hits = recipes["hits"][1..5]
  end

  # def fetch_recipes
  #     url = "https://api.edamam.com/search?q=#{ingredient_input[0]}%2C+#{ingredient_input[1]}%2C+#{ingredient_input[2]}&app_id=#{ENV["API_ID"]}&app_key=#{ENV["API_KEY"]}"
  #     uri = URI(url)
  #     response = Net::HTTP.get(uri)
  #     recipes = JSON.parse(response)
  #     @recipe_hits = recipes["hits"]
  # end

  def valid_ingredients?
    if @recipe_hits == nil
      false
    elsif @recipe_hits.empty?
      false
    else
      true
    end
  end

  def create_recipe
    @recipe_hits.each { |hits| Recipe.new(hits["recipe"]["label"], hits["recipe"]["ingredientLines"], hits["recipe"]["source"], hits["recipe"]["url"], self.ingredient_input) }
  end
end
