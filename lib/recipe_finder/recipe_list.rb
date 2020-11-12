
class RecipeList

    attr_accessor :ingredient_list, :recipe
    @@all = []

    def initialize(recipe)
        @recipe = recipe
        save
    end

    def self.all
        @@all 
    end

    def save
        @@all << self
    end

    # def self.find_by_list(list_object)
    #     Recipe.all.select {|r| r.recipe_list == list_object)
    # end
    

end




