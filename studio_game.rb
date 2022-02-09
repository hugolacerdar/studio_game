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

class Game 

    attr_reader :title
    
    def initialize(title) 
        @title = title
        @players = []
    end

    def add_players(players)
        if(players.class == Array)
            players.each do |p|
                @players << p
            end
        elsif players.class == Player
            @players << players
        end
    end

    def play
        puts "There are currently #{@players.size} players in #{@title}:"
        @players.each do |p|
            p.blam
            p.blam
            p.blam
            p.w00t
            puts p 
        end
    end
end

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

battledroids = Game.new("Battledroids of Ooo")

battledroids.play
battledroids.add_players(player1)
battledroids.add_players([player3, player2])
battledroids.play


