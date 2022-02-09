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

    def strong? 
        @health > 100
    end

    def name=(new_name) 
        @name = new_name.capitalize
    end

    def blam 
    @health -= 10 
    puts "#{@name} got blammed!"
    end

    def w00t
    @health += 15 
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

