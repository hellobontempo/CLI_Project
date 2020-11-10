
class Cli
    @@input = []

    def start
        puts "        Hey good lookin' - whatcha got cookin'?"      
        puts "         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"       
        puts "Please enter an ingredient you would like to cook with."
        ing_1 = gets.chomp #how to handle user data entered in differently
        ing_2 = gets.chomp
        ing_3 = gets.chomp
        @@input << ing_1 << ing_2 << ing_3
        query_1 = Cli.input[0]
        query_2 = Cli.input[1]
        query_3 = Cli.input[2]
        api = Api.new(query_1, query_2, query_3)
        binding.pry
    end

    def self.input
        @@input.sort
    end
    

    # def sort
    #     @@input.sort
    # end
    
end