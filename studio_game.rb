class Player 
    
        attr_reader :health

        # attr_writer + attr_reader
        attr_accessor :name

    def initialize(name, health = 100) 
        @name = name.capitalize
        @health = health
    end

    def score 
        @health+@name.length
    end

    def name=(new_name) 
        @name = new_name.capitalize
    end

    def blam(value = 10) 
       @health -= value 
       puts "#{@name} got blammed!"
    end

    def w00t(value = 15) 
       @health += value 
       puts "#{@name} got w00ted!"
    end

    def to_s
        "I'm #{@name} with #{@health}HP and a score of #{score}GP."
    end

    def time 
        current_time = Time.new
        current_time.strftime("%I:%M:%S")
    end
end

player1 = Player.new("moe")
puts player1

player2 = Player.new("larry", 60)
puts player2

player3 = Player.new("curly", 125)
puts player3
player3.blam
puts player3
player3.w00t
puts player3
puts player3.name
player3.name = "rogerius"
puts player3.score
puts player3

