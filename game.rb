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

    def play(rounds = 1)
        puts "\nThere are #{@players.size} players in #{@title}: "
        @players.each do |player|
          puts player
        end

        1.upto(rounds) do |round|
            puts @players.empty? ? "No players to play" : "\nRound #{round}"

            @players.each do |player|
                GameTurn.take_turn(player)
                puts player
            end
        end

        print_stats
    end

    def print_stats
        if(@players.empty?) 
            return
        end

        puts "\n#{@title} Statistics:"

        strong_players, wimpy_players = @players.partition {|player| player.strong?}
        
        puts "\n#{strong_players.size} strong players:"
        strong_players.each {|player| print_name_and_health(player)} 
        
        puts "\n#{wimpy_players.size} wimpy players:"
        wimpy_players.each {|player| print_name_and_health(player)} 

        puts "\n#{@title} High Scores:"
        @players.sort.each {|player| puts player.score_string}
    end

    def print_name_and_health(player) 
        puts "#{player.name} (#{player.health})"
    end
end

if __FILE__ == $0
    generic_game = Game.new('generic')
    generic_game.play
end