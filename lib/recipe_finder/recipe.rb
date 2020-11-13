
class Recipe
    attr_accessor :label, :ingredients, :source, :url, :ingredient_input
    @@all = []
    @@saved_recipes = []

    def initialize (label, ingredients, source, url, ingredient_input)
        @label = label
        @ingredients = ingredients.sort
        @source = source 
        @url = url
        @ingredient_input = ingredient_input
        @@all << self
    end

    def self.all
        @@all
    end

    def self.display_recipe_search_results
        self.all.each_with_index do |recipe, index|
            puts "#{index+1}. #{recipe.label} - #{recipe.source}"
        end
    end

    def self.saved_recipes
        @@saved_recipes
    end

    def self.display_saved_recipes
        self.saved_recipes.each_with_index.collect do |recipe, index|
            "#{index+1}. #{recipe.label} - #{recipe.source}" 
        end
    end
        
            
end