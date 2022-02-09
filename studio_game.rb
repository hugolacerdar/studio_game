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
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

players = [player1, player2]
players << player3

puts "There are #{players.size} players in the game:"
players.each do |p|
    puts p.health
end