
class Recipe
    attr_accessor :label, :ingredients, :source, :url 
    @@all = []
   
    def initialize (label, ingredients, source, url)
        @label = label.sort
        @ingredients = ingredients.sort
        @source = source 
        @url = url
        @@all << self
    end

    def self.all
        @@all
    end

    def self.display_all_recipes
        Recipe.all.each_with_index do |recipe, index|
        puts "RECIPE #{index+1}:"
        puts "#{recipe.label.upcase}"
        puts "Ingredients: \n#{recipe.ingredients.join("\n")}"
        puts "            ~~~"
        puts "This recipe is from: #{recipe.source}"
        end
    end

end