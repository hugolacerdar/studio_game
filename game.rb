require_relative 'player'
require_relative 'die'

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
        puts "There are #{@players.size} players in #{@title}: "
        @players.each do |player|
          puts player
        end

        @players.each do |player|
            die = Die.new

            case die.roll
            when 1..2
                player.blam
            when 3..4
                puts "#{player.name} was ignored."
            else
                player.w00t
            end
            puts player
        end
    end
end

if __FILE__ == $0
    generic_game = Game.new('generic')
    generic_game.play
end