require_relative 'player'
require_relative 'game_turn'

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
            GameTurn.take_turn(player)
            puts player
        end
    end
end

if __FILE__ == $0
    generic_game = Game.new('generic')
    generic_game.play
end