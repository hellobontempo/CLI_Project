
class Recipe
    attr_accessor :label, :ingredients, :source, :url 
    @@all = []
   
    def initialize (label, ingredients, source, url)
        @label = label
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
        puts 
        puts "Ingredients: \n#{recipe.ingredients.join("\n")}"
        puts "This recipe is from: #{recipe.source}"
        puts "              ~~~"
        puts "Enter #{index+1} to view recipe in browser."
        puts "-------------------------------------------"
        puts 
        end
        input = gets.strip.to_i - 1
            if input == 0
                system("open #{self.all[0].url}")
            elsif input == 1
                system("open #{self.all[1].url}")
            elsif input == 2
                system("open #{self.all[2].url}")
            end
    end


         
            
end