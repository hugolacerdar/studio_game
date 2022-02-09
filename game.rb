require_relative 'player'

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

if __FILE__ == $0
    generic_game = Game.new('generic')
    generic_game.play
end