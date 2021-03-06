require_relative "playable"

module StudioGame
    class Player 
        include Playable
        
        attr_accessor :name, :health

        def initialize(name, health = 100) 
            @name = name.capitalize
            @health = health
            @treasure_stack = Hash.new(0)
        end

        def self.from_csv(line) 
            name, health = line.split(',')
            Player.new(name, Integer(health))
        end

        def store_treasure(treasure)
            @treasure_stack[treasure.item] += treasure.value
            puts "#{@name} found the item #{treasure.item} (+#{treasure.value})"
            puts "#{@name}'s treasures: #{@treasure_stack}"
        end

        def score 
            @health + total_gold
        end

        def total_gold 
            @treasure_stack.values.reduce(0, :+)
        end

        def score_string 
            "#{@name.ljust(30, '.')} #{score}"
        end

        def each_treasure() 
            @treasure_stack.each do |item, value|
                yield Treasure.new(item, value)
            end
        end

        def <=>(other_player) 
            other_player.score <=> score
        end

        def name=(new_name) 
            @name = new_name.capitalize
        end

        def to_s
            "I'm #{@name} with health = #{@health}HP, total gold = #{total_gold} and a score = #{score}GP."
        end

        def to_csv
            "#{@name},#{score}"
        end

        def time 
            current_time = Time.new
            current_time.strftime("%I:%M:%S")
        end
    end
end