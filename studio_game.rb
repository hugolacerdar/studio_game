class Player 
    def initialize(name, health = 100) 
        @name = name.capitalize
        @health = health
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
        "I'm #{@name} with #{@health}HP"
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

